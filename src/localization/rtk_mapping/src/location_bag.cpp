#include <rosbag/bag.h>
#include <rosbag/view.h>
#include <ros/ros.h>

#include <sensor_msgs/PointCloud2.h>

#include <boost/foreach.hpp>
#include <unistd.h>
#include <string>

#include <thread>
#include <chrono>

#include <ndt_cpu/NormalDistributionsTransform.h>

#include <tf/transform_datatypes.h>
#include <tf/transform_broadcaster.h>

#include "func.h"
#include "map_manager.h"
#include "tic_toc.h"

#define foreach BOOST_FOREACH

int main(int argc, char **argv)
{

    ros::init(argc, argv, "location_bag");
    ros::NodeHandle nh;

    // load map
    std::string pcd_path;
    nh.getParam("pcd_path", pcd_path);
    printf("pcd path : %s \n", pcd_path.c_str());

    std::string submap_path;
    nh.getParam("submap_path", submap_path);
    printf("submap_path : %s \n", submap_path.c_str());

    std::string sc_path;
    nh.getParam("sc_path", sc_path);
    printf("sc_path : %s \n", sc_path.c_str());

    map_manager map_manager(pcd_path, submap_path, sc_path);
    map_manager.load_map();
    map_manager.generate_submap();
    printf("map loaded !!! \n");

    pcl::PointCloud<pcl::PointXYZI>::Ptr map(new pcl::PointCloud<pcl::PointXYZI>);

    // ros pubilish
    ros::Publisher pubOdom;
    ros::Publisher pubPath;
    ros::Publisher pubRsLidar;
    ros::Publisher pubMap;
    pubOdom = nh.advertise<nav_msgs::Odometry>("/odometry_", 5);
    pubPath = nh.advertise<nav_msgs::Path>("/path", 5);
    pubRsLidar = nh.advertise<sensor_msgs::PointCloud2>("/rs_lidar", 2);
    pubMap = nh.advertise<sensor_msgs::PointCloud2>("/map", 2);

    nav_msgs::Path pathGT;
    static tf::TransformBroadcaster br;
    tf::Transform transform;
    tf::Quaternion q;

    // init location and match map
    double pose_x = 0;
    double pose_y = 0;

    //thread
    bool isNew = false;
    std::thread t_thread;

    // location info
    bool init = false;
    Eigen::Vector3d t_lidar(0, 0, 0);
    Eigen::Quaterniond q_lidar(1, 0, 0, 0);
    Eigen::Vector3d t_lidar_last(0, 0, 0);
    Eigen::Quaterniond q_lidar_last(1, 0, 0, 0);

    // read from bag file
    std::string bag_path;
    nh.getParam("bag_path", bag_path);
    printf("bag data path : %s \n", bag_path.c_str());
    rosbag::Bag bag;
    bag.open(bag_path, rosbag::bagmode::Read);

    std::vector<std::string> topics;
    topics.push_back(std::string("/rslidar_points"));
    rosbag::View view(bag, rosbag::TopicQuery(topics));

    //ndt init
    cpu::NormalDistributionsTransform<pcl::PointXYZI, pcl::PointXYZI> anh_ndt;
    anh_ndt.setResolution(1.0);
    anh_ndt.setMaximumIterations(30);
    anh_ndt.setStepSize(0.1);
    anh_ndt.setTransformationEpsilon(0.01);

    //Voxel downSize
    pcl::VoxelGrid<pcl::PointXYZI> downSizeFilter_25;
    downSizeFilter_25.setLeafSize(0.25, 0.25, 0.25);

    //Pointcloud
    pcl::PointCloud<pcl::PointXYZI>::Ptr tmp(new pcl::PointCloud<pcl::PointXYZI>());
    pcl::PointCloud<pcl::PointXYZI>::Ptr pRslidar(new pcl::PointCloud<pcl::PointXYZI>());
    pcl::PointCloud<pcl::PointXYZI>::Ptr pSourceCloud(new pcl::PointCloud<pcl::PointXYZI>());

    foreach (rosbag::MessageInstance const m, view)
    {
        std::string topic = m.getTopic();

        sensor_msgs::PointCloud2::ConstPtr pcloud = m.instantiate<sensor_msgs::PointCloud2>();

        if (pcloud != NULL)
        {
            TicToc pcloud_time;
            //preprocess
            pcl::fromROSMsg(*pcloud, *tmp);
            pointcloud_in_range(5, 100, tmp, pRslidar);

            downSizeFilter_25.setInputCloud(pRslidar);
            downSizeFilter_25.filter(*pSourceCloud);

            Eigen::Matrix4f trans(Eigen::Matrix4f::Identity());
            if (!init)
            {

                map_manager.init_location(pRslidar, q_lidar, t_lidar);

                q_lidar_last = q_lidar;
                t_lidar_last = t_lidar;
                init = true;

                pose_x = t_lidar(0);
                pose_y = t_lidar(1);

                t_thread = std::thread(&map_manager::generate_matchcloud, &map_manager, std::ref(pose_x), std::ref(pose_y), std::ref(isNew), map);
                std::this_thread::sleep_for(std::chrono::seconds(3));
                anh_ndt.setInputTarget(map);
            }
            else
            {
                TicToc ndt_time;
                Eigen::Vector3d dt = t_lidar - t_lidar_last;
                Eigen::Quaterniond dq = q_lidar * q_lidar_last.conjugate();

                Eigen::Vector3d t_guess = t_lidar + dt;
                Eigen::Quaterniond q_guess = dq * q_lidar;

                Eigen::Translation3d init_translation(t_guess(0), t_guess(1), t_guess(2));
                Eigen::AngleAxisd init_rotation(q_guess);
                Eigen::Matrix4d init_guess = (init_translation * init_rotation) * Eigen::Matrix4d::Identity();

                anh_ndt.setInputSource(pSourceCloud);
                anh_ndt.align(init_guess.cast<float>());

                trans = anh_ndt.getFinalTransformation();

                printf("ndt time : %.2f    ", ndt_time.toc());

                Eigen::Vector3d t(trans(0, 3), trans(1, 3), trans(2, 3));
                Eigen::Matrix3d R;
                R << trans(0, 0), trans(0, 1), trans(0, 2), trans(1, 0), trans(1, 1), trans(1, 2), trans(2, 0), trans(2, 1), trans(2, 2);

                q_lidar_last = q_lidar;
                t_lidar_last = t_lidar;

                q_lidar = R;
                t_lidar = t;

                pose_x = t_lidar(0);
                pose_y = t_lidar(1);

                // // ndt result
                // int iteration = anh_ndt.getFinalNumIteration();
                // double fitness_score = anh_ndt.getFitnessScore();
                // double trans_probability = anh_ndt.getTransformationProbability();

                // printf("hasConverged : %d\n", anh_ndt.hasConverged());
                // printf("iteration : %d\n", iteration);
                // printf("fitness_score : %f\n", fitness_score);
                // printf("trans_probability :%f\n", trans_probability);
            }
            printf("loop time : %.2f\n", pcloud_time.toc());

            printf("x : %.2lf, y : %.2lf, z : %.2lf \n", t_lidar(0), t_lidar(1), t_lidar(2));

            if (isNew)
            {
                anh_ndt.setInputTarget(map);
                isNew = false;
            }

            //visulization
            //transform_w_curr(q_lidar, t_lidar, pRslidar);
            sensor_msgs::PointCloud2 Rslidar_msg;
            pcl::toROSMsg(*pRslidar, Rslidar_msg);
            Rslidar_msg.header.stamp = pcloud->header.stamp;
            Rslidar_msg.header.frame_id = "/rslidar";
            pubRsLidar.publish(Rslidar_msg);

            sensor_msgs::PointCloud2 Map_msg;
            pcl::toROSMsg(*map, Map_msg);
            Map_msg.header.stamp = Rslidar_msg.header.stamp;
            Map_msg.header.frame_id = "/map";
            pubMap.publish(Map_msg);

            nav_msgs::Odometry odomGT;
            odomGT.header.frame_id = "/map";

            odomGT.header.stamp = Rslidar_msg.header.stamp;
            odomGT.pose.pose.orientation.x = q_lidar.x();
            odomGT.pose.pose.orientation.y = q_lidar.y();
            odomGT.pose.pose.orientation.z = q_lidar.z();
            odomGT.pose.pose.orientation.w = q_lidar.w();
            odomGT.pose.pose.position.x = t_lidar(0);
            odomGT.pose.pose.position.y = t_lidar(1);
            odomGT.pose.pose.position.z = t_lidar(2);
            pubOdom.publish(odomGT);

            geometry_msgs::PoseStamped poseGT;
            poseGT.header = odomGT.header;
            poseGT.pose = odomGT.pose.pose;
            pathGT.header.frame_id = "/map";
            pathGT.header.stamp = odomGT.header.stamp;
            pathGT.poses.push_back(poseGT);
            pubPath.publish(pathGT);

            transform.setOrigin(tf::Vector3(t_lidar(0), t_lidar(1), t_lidar(2)));
            q.setW(q_lidar.w());
            q.setX(q_lidar.x());
            q.setY(q_lidar.y());
            q.setZ(q_lidar.z());
            transform.setRotation(q);
            br.sendTransform(tf::StampedTransform(transform, pcloud->header.stamp, "/map", "/rslidar"));
            // usleep(5e3);
        }

        if (!ros::ok())
            break;
    }

    bag.close();
    t_thread.join();
    return 0;
}