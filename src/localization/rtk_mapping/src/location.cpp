#include <ros/ros.h>

#include <sensor_msgs/PointCloud2.h>
#include <geometry_msgs/PoseWithCovarianceStamped.h>
#include <geometry_msgs/PoseStamped.h>
#include <geometry_msgs/TwistStamped.h>
#include <location_msgs/RTK.h>

#include <unistd.h>
#include <string>
#include <vector>
#include <map>
#include <set>
#include <cmath>

#include <stdio.h>

#include <mutex>
#include <thread>
#include <chrono>

#include <pcl/point_types.h>
#include <pcl/io/pcd_io.h>
#include <pcl/point_cloud.h>
#include <pcl/filters/voxel_grid.h>
#include <pcl/common/common.h>
#include <ndt_cpu/NormalDistributionsTransform.h>
#include <pclomp/ndt_omp.h>

#include <pcl/kdtree/kdtree_flann.h>

#include <tf/transform_datatypes.h>
#include <tf/transform_broadcaster.h>

#include "func.h"
#include "Scancontext.h"
#include "tic_toc.h"

struct imu_data
{
    double time;

    double accel_x;
    double accel_y;
    double accel_z;

    double angrate_x;
    double angrate_y;
    double angrate_z;

    double velocity_x;
    double velocity_y;
    double velocity_z;

    double angle_x;
    double angle_y;
    double angle_z;
};

class location
{
public:
    EIGEN_MAKE_ALIGNED_OPERATOR_NEW
    location(ros::NodeHandle nh) : nh_(nh)
    {
        nh_.getParam("map_path", map_path_);
        nh_.getParam("use_sc", use_sc_);
        nh_.getParam("imu_topic_name", imu_topic_name_);
        nh_.getParam("odo_topic_name", odo_topic_name_);
        pcd_path_ = map_path_ + "/map.pcd";
        submap_path_ = map_path_ + "/submap";
        keypose_path_ = map_path_ + "/lidar.txt";

        sc_path_ = map_path_ + "/sc_map";
        key_frames_path_ = map_path_ + "/key_frames";
        sc_test_path = map_path_ + "/sc_test";

        pRslidarRaw.reset(new pcl::PointCloud<pcl::PointXYZI>());
        pRslidar.reset(new pcl::PointCloud<pcl::PointXYZI>());
        pRslidarDS.reset(new pcl::PointCloud<pcl::PointXYZI>());
        pMap.reset(new pcl::PointCloud<pcl::PointXYZI>());
        pSubMap.reset(new pcl::PointCloud<pcl::PointXYZI>());
        kdtreeSurroundingKeyPoses.reset(new pcl::KdTreeFLANN<pcl::PointXYZ>());

        NewPointCloud = false;

        printf("submap path : %s \n", submap_path_.c_str());

        load_map();
        generate_submap();
        printf("map loaded !!! \n");

        downSizeFilter_25.setLeafSize(0.25, 0.25, 0.25);
        downSizeFilter_50.setLeafSize(0.5, 0.5, 0.5);

        anh_ndt.setResolution(1.0);
        anh_ndt.setMaximumIterations(10);
        anh_ndt.setStepSize(0.1);
        anh_ndt.setTransformationEpsilon(0.01);
        anh_ndt.setNumThreads(4);
        anh_ndt.setNeighborhoodSearchMethod(pclomp::DIRECT7);
        palign.reset(new pcl::PointCloud<pcl::PointXYZI>());

        init = false;
        t_lidar = Eigen::Vector3d(0, 0, 0);
        q_lidar = Eigen::Quaterniond(1, 0, 0, 0);
        t_lidar_last = Eigen::Vector3d(0, 0, 0);
        q_lidar_last = Eigen::Quaterniond(1, 0, 0, 0);
        pose_x = 0;
        pose_y = 0;

        lidar_time = -1;
        lidar_time_last = -1;
        pose_dt = -1;
        pose_dt_last = -1;

        map_centerx = -10000;
        map_centery = -10000;

        imu_cur.time = 0;
        imu_cur.accel_x = 0;
        imu_cur.accel_y = 0;
        imu_cur.accel_z = 0;

        imu_cur.angrate_x = 0;
        imu_cur.angrate_y = 0;
        imu_cur.angrate_z = 0;

        imu_cur.velocity_x = 0;
        imu_cur.velocity_y = 0;
        imu_cur.velocity_z = 0;

        imu_cur.angle_x = 0;
        imu_cur.angle_y = 0;
        imu_cur.angle_z = 0;

        q_imu = Eigen::Quaterniond(1, 0, 0, 0);
        t_imu = Eigen::Vector3d(0, 0, 0);
        gravity = Eigen::Vector3d(0, 0, 9.81);

        pubOdom = nh_.advertise<geometry_msgs::PoseStamped>(odo_topic_name_, 5);
        pubImuOdom = nh_.advertise<geometry_msgs::PoseStamped>(imu_topic_name_, 5);
        // pubTwist = nh_.advertise<geometry_msgs::TwistStamped>("/twist", 5);
        pubPath = nh_.advertise<nav_msgs::Path>("/path", 5);
        pubImuPath = nh_.advertise<nav_msgs::Path>("/imu_path", 5);
        pubRsLidar = nh_.advertise<sensor_msgs::PointCloud2>("/rs_lidar2", 2);
        pubMap = nh_.advertise<sensor_msgs::PointCloud2>("/map", 2);
        pubSubMap = nh_.advertise<sensor_msgs::PointCloud2>("/submap", 2);

        subLaserCloudRaw = nh_.subscribe<sensor_msgs::PointCloud2>("/rslidar_points", 1, &location::laserCloudRawHandler, this);
        subImu = nh_.subscribe<location_msgs::RTK>("/rtk_data", 10, &location::ImuHandle, this);
        if (!use_sc_)
            subInitPose = nh_.subscribe<geometry_msgs::PoseWithCovarianceStamped>("/initialpose", 2, &location::InitPoseHandler, this);
    }

    void laserCloudRawHandler(const sensor_msgs::PointCloud2ConstPtr &msg)
    {
        mtx_p.lock();
        pcl::fromROSMsg(*msg, *pRslidarRaw);
        // ROS_INFO("lidar time1 : %.3lf ", msg->header.stamp.toSec());
        NewPointCloud = true;
        mtx_p.unlock();
    }

    template <class Matrix>
    bool read_matrix(const char *filename, Matrix &matrix)
    {
        std::ifstream in(filename, std::ios::in | std::ios::binary);
        if (!in.good())
        {
            return false;
        }
        typename Matrix::Index rows = 0, cols = 0;
        in.read((char *)(&rows), sizeof(typename Matrix::Index));
        in.read((char *)(&cols), sizeof(typename Matrix::Index));
        matrix.resize(rows, cols);
        in.read((char *)matrix.data(), rows * cols * sizeof(typename Matrix::Scalar));
        in.close();
        return true;
    }
    template <class datatype>
    bool read_vector(const char *filename, std::vector<datatype> &vec)
    {
        std::ifstream in(filename, std::ios::in | std::ios::binary);
        if (!in.good())
        {
            return false;
        }
        int num;
        in.read((char *)(&num), sizeof(int));
        vec.resize(num);
        in.read((char *)vec.data(), num * sizeof(datatype));
        in.close();
        return true;
    }

    void InitPoseHandler(const geometry_msgs::PoseWithCovarianceStamped::ConstPtr &msg)
    {
        if (init)
            return;
        t_lidar(0) = msg->pose.pose.position.x;
        t_lidar(1) = msg->pose.pose.position.y;
        t_lidar(2) = msg->pose.pose.position.z;
        q_lidar.x() = msg->pose.pose.orientation.x;
        q_lidar.y() = msg->pose.pose.orientation.y;
        q_lidar.z() = msg->pose.pose.orientation.z;
        q_lidar.w() = msg->pose.pose.orientation.w;

        std::vector<int> pointSearchInd;
        std::vector<float> pointSearchSqDis;
        pcl::PointXYZ searchPose(t_lidar(0), t_lidar(1), t_lidar(2));
        kdtreeSurroundingKeyPoses->nearestKSearch(searchPose, 2, pointSearchInd, pointSearchSqDis);
        double z = 0;
        for (int i = 0; i < pointSearchInd.size(); i++)
        {
            int id = pointSearchInd[i];
            z += keypose_t[id](2);
        }
        t_lidar(2) = (z / 2);

        t_lidar_last = t_lidar;
        q_lidar_last = q_lidar;
        pose_x = t_lidar(0);
        pose_y = t_lidar(1);

        q_imu = q_lidar;
        t_imu = t_lidar;

        Eigen::Vector3d eulerAngle = q_imu.matrix().eulerAngles(2, 1, 0);
        imu_cur.angle_z = eulerAngle(0);
        imu_cur.angle_y = eulerAngle(1);
        imu_cur.angle_x = eulerAngle(2);

        init = true;

        pose_visulization();
    }

    void ImuHandle(const location_msgs::RTKConstPtr &msg)
    {
        if (!init)
            return;
        mtx_imu.lock();
        Eigen::Vector3d imu_gravity = q_imu * gravity;

        imu_cur.accel_x = msg->AccelRawY - imu_gravity(0);
        imu_cur.accel_y = -msg->AccelRawX - imu_gravity(1);
        imu_cur.accel_z = msg->AccelRawZ - imu_gravity(2);

        imu_cur.angrate_x = msg->AngRateRawY;
        imu_cur.angrate_y = -msg->AngRateRawX;
        imu_cur.angrate_z = msg->AngRateRawZ;

        if (imu_cur.time <= 0.01)
        {
            imu_cur.time = msg->stamp.toSec();
            mtx_imu.unlock();
            return;
        }

        double time = msg->stamp.toSec();
        double dt = time - imu_cur.time;

        t_imu(0) = t_imu(0) + imu_cur.velocity_x * dt + 0.5 * imu_cur.accel_x * dt * dt;
        t_imu(1) = t_imu(1) + imu_cur.velocity_y * dt + 0.5 * imu_cur.accel_y * dt * dt;
        t_imu(2) = t_imu(2) + imu_cur.velocity_z * dt + 0.5 * imu_cur.accel_z * dt * dt;

        imu_cur.velocity_x = imu_cur.velocity_x + imu_cur.accel_x * dt;
        imu_cur.velocity_y = imu_cur.velocity_y + imu_cur.accel_y * dt;
        imu_cur.velocity_z = imu_cur.velocity_z + imu_cur.accel_z * dt;

        imu_cur.angle_x = imu_cur.angle_x + imu_cur.angrate_x * dt;
        imu_cur.angle_y = imu_cur.angle_y + imu_cur.angrate_y * dt;
        imu_cur.angle_z = imu_cur.angle_z + imu_cur.angrate_z * dt;

        q_imu = Eigen::AngleAxisd(imu_cur.angle_z, Eigen::Vector3d::UnitZ()) *
                Eigen::AngleAxisd(imu_cur.angle_y, Eigen::Vector3d::UnitY()) *
                Eigen::AngleAxisd(imu_cur.angle_x, Eigen::Vector3d::UnitX());

        imu_cur.time = time;

        geometry_msgs::PoseStamped odom;
        odom.pose.orientation.x = q_imu.x();
        odom.pose.orientation.y = q_imu.y();
        odom.pose.orientation.z = q_imu.z();
        odom.pose.orientation.w = q_imu.w();
        odom.pose.position.x = t_imu(0);
        odom.pose.position.y = t_imu(1);
        odom.pose.position.z = t_imu(2);
        odom.header.frame_id = "/map";
        odom.header.stamp = msg->stamp;
        pubImuOdom.publish(odom);

        geometry_msgs::TwistStamped twist;
        twist.header = odom.header;
        twist.header.frame_id = "base_link";
        twist.twist.angular.x = imu_cur.angrate_x;
        twist.twist.angular.y = imu_cur.angrate_y;
        twist.twist.angular.z = imu_cur.angrate_z;
        twist.twist.linear.x = imu_cur.velocity_x;
        twist.twist.linear.y = imu_cur.velocity_y;
        twist.twist.linear.z = imu_cur.velocity_z;
        // pubTwist.publish(twist);

        imu_path.poses.push_back(odom);
        imu_path.header.frame_id = "/map";
        imu_path.header.stamp = odom.header.stamp;
        pubImuPath.publish(imu_path);

        // printf("imu : %.3lf, %.3lf, %.3lf, %.3lf\n", t_imu(0), t_imu(1), t_imu(2), imu_cur.time);
        mtx_imu.unlock();
    }

    void LidarHandle()
    {
        ros::Rate rate(100);
        while (ros::ok())
        {
            if (NewPointCloud)
                LidarProcess();
            rate.sleep();
        }
    }

    void LidarProcess()
    {
        lidar_time = pRslidarRaw->header.stamp * 0.000001;
        msgLidarTime = msgLidarTime.fromSec(lidar_time);
        // ROS_INFO("lidar time2 : %.3lf ", lidar_time);
        if (!init && use_sc_)
        {
            mtx_p.lock();
            pointcloud_in_range(5, 100, pRslidarRaw, pRslidar);
            NewPointCloud = false;
            mtx_p.unlock();

            init = init_location_sc(pRslidar, q_lidar, t_lidar);

            q_lidar_last = q_lidar;
            t_lidar_last = t_lidar;
            pose_x = t_lidar(0);
            pose_y = t_lidar(1);

            q_imu = q_lidar;
            t_imu = t_lidar;
            Eigen::Vector3d eulerAngle = q_imu.matrix().eulerAngles(2, 1, 0);
            imu_cur.angle_z = eulerAngle(0);
            imu_cur.angle_y = eulerAngle(1);
            imu_cur.angle_x = eulerAngle(2);

            printf("pose_x : %.3lf\n", pose_x);
            printf("pose_y : %.3lf\n", pose_y);
            return;
        }

        if (init)
        {
            mtx.lock();
            if (pSubMap->points.empty())
            {
                mtx.unlock();
                printf("SubMap not loaded !!! \n");
            }
            else
            {
                TicToc ndt_time;

                mtx_p.lock();
                pointcloud_in_range(5, 100, pRslidarRaw, pRslidar);
                NewPointCloud = false;
                mtx_p.unlock();

                downSizeFilter_50.setInputCloud(pRslidar);
                downSizeFilter_50.filter(*pRslidarDS);
                Eigen::Matrix4f trans(Eigen::Matrix4f::Identity());

                Eigen::Vector3d t_guess = t_imu;
                Eigen::Quaterniond q_guess = q_imu;

                // printf("guess1 : %.3lf, %.3lf, %.3lf\n", t_imu(0), t_imu(1), t_imu(2));
                // printf("guess2 : %.3lf, %.3lf, %.3lf\n", t_guess(0), t_guess(1), t_guess(2));
                Eigen::Translation3d init_translation(t_guess(0), t_guess(1), t_guess(2));
                Eigen::AngleAxisd init_rotation(q_guess);
                Eigen::Matrix4d init_guess = (init_translation * init_rotation) * Eigen::Matrix4d::Identity();

                anh_ndt.setInputSource(pRslidarDS);
                anh_ndt.align(*palign ,init_guess.cast<float>());

                trans = anh_ndt.getFinalTransformation();
                int iteration = anh_ndt.getFinalNumIteration();
                bool converged = anh_ndt.hasConverged();
                printf("ndt time : %.2f  iteration : %d converged : %d \n", ndt_time.toc(), iteration, converged);
                
                Eigen::Vector3d t(trans(0, 3), trans(1, 3), trans(2, 3));
                Eigen::Matrix3d R;
                R << trans(0, 0), trans(0, 1), trans(0, 2), trans(1, 0), trans(1, 1), trans(1, 2), trans(2, 0), trans(2, 1), trans(2, 2);

                q_lidar_last = q_lidar;
                t_lidar_last = t_lidar;

                q_lidar = R;
                t_lidar = t;

                pose_x = t_lidar(0);
                pose_y = t_lidar(1);

                if (lidar_time_last > 0)
                {
                    pose_dt_last = lidar_time - lidar_time_last;
                }
                //printf("location : %.3lf, %.3lf, %.3lf\n", t_lidar(0), t_lidar(1), t_lidar(2));
                lidar_time_last = lidar_time;
                mtx.unlock();

                mtx_imu.lock();
                q_imu = q_imu * q_guess.conjugate() * q_lidar;
                t_imu = t_lidar + t_imu - t_guess;
                Eigen::Vector3d eulerAngle = q_imu.matrix().eulerAngles(2, 1, 0);
                imu_cur.angle_z = eulerAngle(0);
                imu_cur.angle_y = eulerAngle(1);
                imu_cur.angle_x = eulerAngle(2);
                if (pose_dt_last > 0)
                {
                    imu_cur.velocity_x = (t_lidar(0) - t_lidar_last(0)) / pose_dt_last;
                    imu_cur.velocity_y = (t_lidar(1) - t_lidar_last(1)) / pose_dt_last;
                    imu_cur.velocity_z = (t_lidar(2) - t_lidar_last(2)) / pose_dt_last;

                    Eigen::Vector3d Angle = q_lidar.matrix().eulerAngles(2, 1, 0);
                    Eigen::Vector3d Angle_last = q_lidar_last.matrix().eulerAngles(2, 1, 0);
                    imu_cur.angrate_x = (Angle(2) - Angle_last(2)) / pose_dt_last;
                    imu_cur.angrate_y = (Angle(1) - Angle_last(1)) / pose_dt_last;
                    imu_cur.angrate_z = (Angle(0) - Angle_last(0)) / pose_dt_last;
                }
                mtx_imu.unlock();
            }
            pose_visulization();
        }
    }

    void load_map()
    {
        // load map and downsize
        if (pcl::io::loadPCDFile<pcl::PointXYZI>(pcd_path_, *pMap) == -1)
        {
            printf("can't read open pcd \n");
            exit(-1);
        }
        else
        {
            printf("open file : %s \n", pcd_path_.c_str());
        }

        // load key pose
        FILE *keypose_read_fp = NULL;
        keypose_read_fp = fopen(keypose_path_.c_str(), "r");

        if (keypose_read_fp == NULL)
        {
            printf("fail to open lidar txt !!!\n");
            exit(1);
        }
        else
        {
            vector<double> tmp(8, 0);
            while (!feof(keypose_read_fp))
            {
                fscanf(keypose_read_fp, "%lf %lf %lf %lf %lf %lf %lf %lf", &tmp[0], &tmp[1], &tmp[2], &tmp[3], &tmp[4], &tmp[5], &tmp[6], &tmp[7]);
                Eigen::Vector3d t(tmp[1], tmp[2], tmp[3]);
                Eigen::Quaterniond q(tmp[4], tmp[5], tmp[6], tmp[7]);
                q.normalize();
                keypose_t.push_back(t);
                keypose_q.push_back(q);
            }
            keypose_t.pop_back();
            keypose_q.pop_back();
        }

        pcl::PointCloud<pcl::PointXYZ>::Ptr cloudKeyPoses3D(new pcl::PointCloud<pcl::PointXYZ>());
        pcl::PointXYZ p;
        for (int i = 0; i < keypose_t.size(); i++)
        {
            p.x = keypose_t[i](0);
            p.y = keypose_t[i](1);
            p.z = keypose_t[i](2);
            cloudKeyPoses3D->points.push_back(p);
        }

        kdtreeSurroundingKeyPoses->setInputCloud(cloudKeyPoses3D);
        printf("map loaded success!!! \n keyframe nums : %ld point nums : %ld \n", cloudKeyPoses3D->points.size(), pMap->points.size());

        if (!use_sc_)
            return;

        // load sc pose
        string sc_txt = map_path_ + "/sc.txt";
        FILE *sc_read_fp = NULL;
        sc_read_fp = fopen(sc_txt.c_str(), "r");

        if (sc_read_fp == NULL)
        {
            printf("fail to open sc txt !!!\n");
            exit(1);
        }
        else
        {
            vector<double> tmp(7, 0);
            while (!feof(sc_read_fp))
            {
                fscanf(sc_read_fp, "%lf %lf %lf %lf %lf %lf %lf", &tmp[0], &tmp[1], &tmp[2], &tmp[3], &tmp[4], &tmp[5], &tmp[6]);
                Eigen::Vector3d t(tmp[0], tmp[1], tmp[2]);
                Eigen::Quaterniond q(tmp[6], tmp[3], tmp[4], tmp[5]);
                sc_t.push_back(t);
                sc_q.push_back(q);
            }
            sc_t.pop_back();
            sc_q.pop_back();
            printf("successfully open sc txt ! \n");
        }

        for (int i = 1; i < sc_t.size(); ++i)
        {
            Eigen::MatrixXd temp;
            std::string file_path = key_frames_path_ + "/scan_context_" + std::to_string(i) + "_";
            read_matrix((file_path + "polarcontexts").c_str(), temp);
            sc.polarcontexts_.push_back(temp);
            read_matrix((file_path + "polarcontext_invkeys").c_str(), temp);
            sc.polarcontext_invkeys_.push_back(temp);
            read_matrix((file_path + "polarcontext_vkeys").c_str(), temp);
            sc.polarcontext_vkeys_.push_back(temp);
            std::vector<float> vt;
            read_vector((file_path + "polarcontext_invkeys_mat").c_str(), vt);
            sc.polarcontext_invkeys_mat_.push_back(vt);
        }
        printf("successfully load sc data ! \n");
        sc.treereconstruction();
    }

    void generate_submap()
    {
        // submap size 100m * 100m
        for (uint32_t i = 0; i < pMap->points.size(); i++)
        {
            double px = pMap->points[i].x;
            double py = pMap->points[i].y;

            int x = floor(px / 60);
            int y = floor(py / 60);

            string str = std::to_string(x) + "_" + std::to_string(y);
            submap_name.insert(str);
        }
    }

    bool init_location_sc(pcl::PointCloud<pcl::PointXYZI>::Ptr cloud_in,
                          Eigen::Quaterniond &q_out, Eigen::Vector3d &t_out)
    {
        std::pair<int, float> result{-1, 0};

        //找到最符合的pcd的id
        result = sc.relocalize(*cloud_in);
        printf("match result : %d, %f \n", result.first, result.second / M_PI * 180);

        if (result.first == -1)
        {
            printf("init location failed !!! \n");
            return false;
        }

        Eigen::Quaterniond q_match = sc_q[result.first];
        Eigen::Vector3d t_match = sc_t[result.first];

        //获取该xy对应的pcd
        pcl::PointCloud<pcl::PointXYZI>::Ptr cloud_match(new pcl::PointCloud<pcl::PointXYZI>);
        string sc_match_cloud = sc_path_ + "/" + std::to_string(result.first + 1) + ".pcd";
        if (pcl::io::loadPCDFile<pcl::PointXYZI>(sc_match_cloud, *cloud_match) == -1)
        {
            printf("init_location can't read open pcd \n");
            exit(-1);
        }

        // //debug
        // string sc_test_path_cloudin = sc_test_path + "/" + "cloudin.pcd";
        // string sc_test_path_cloudmatch = sc_test_path + "/" + "cloudmatch.pcd";
        // pcl::io::savePCDFileASCII(scdebug_test_path_cloudin, *cloud_in);
        // pcl::io::savePCDFileASCII(sc_test_path_cloudmatch, *cloud_match);

        downSizeFilter_50.setInputCloud(cloud_in);
        downSizeFilter_50.filter(*cloud_in);

        cpu::NormalDistributionsTransform<pcl::PointXYZI, pcl::PointXYZI> ndt;
        ndt.setResolution(1.0);
        ndt.setMaximumIterations(30);
        ndt.setStepSize(0.1);
        ndt.setTransformationEpsilon(0.01);

        ndt.setInputTarget(cloud_match);
        ndt.setInputSource(cloud_in);

        Eigen::Translation3f init_translation(0, 0, 0);
        Eigen::AngleAxisf init_rotation_z(-result.second, Eigen::Vector3f::UnitZ());
        Eigen::Matrix4f init_guess = (init_translation * init_rotation_z) * Eigen::Matrix4f::Identity();

        ndt.align(init_guess);
        Eigen::Matrix4f trans(Eigen::Matrix4f::Identity());
        trans = ndt.getFinalTransformation();

        Eigen::Vector3d t(trans(0, 3), trans(1, 3), trans(2, 3));
        Eigen::Matrix3d R;
        R << trans(0, 0), trans(0, 1), trans(0, 2), trans(1, 0), trans(1, 1), trans(1, 2), trans(2, 0), trans(2, 1), trans(2, 2);
        Eigen::Quaterniond q;
        q = R;

        q_out = q_match * q;
        t_out = t_match + q_match * t;

        double score = ndt.getFitnessScore();
        if(score >= 0.8)
        {   
            printf("bad sc init !!!\n");
            return false;
        }
        else
        {
            printf("good sc init !!!\n");
            return true;
        }

        //DEBUG
        // printf("init found x : %.2lf, y :%.2lf \n", t_out[0], t_out[1]);
        // printf("%.4f, %.4f, %.4f, %.4f \n", trans(0,0), trans(0,1), trans(0,2), trans(0,3));
        // printf("%.4f, %.4f, %.4f, %.4f \n", trans(1,0), trans(1,1), trans(1,2), trans(1,3));
        // printf("%.4f, %.4f, %.4f, %.4f \n", trans(2,0), trans(2,1), trans(2,2), trans(2,3));
        // printf("%.4f, %.4f, %.4f, %.4f \n", trans(3,0), trans(3,1), trans(3,2), trans(3,3));
    }

    void generate_matchcloud()
    {
        while (ros::ok())
        {
            if (!init)
            {
                std::this_thread::sleep_for(std::chrono::milliseconds(10));
                continue;
            }

            int center_x = floor(pose_x / 60);
            int center_y = floor(pose_y / 60);
            if (center_x == map_centerx && center_y == map_centery)
            {
                std::this_thread::sleep_for(std::chrono::milliseconds(10));
                continue;
            }

            printf("generate new match map and center index : %d_%d \n", center_x, center_y);
            int x = center_x;
            int y = center_y;

            vector<int> dt = {-1, 0, 1};

            pcl::PointCloud<pcl::PointXYZI>::Ptr tmp(new pcl::PointCloud<pcl::PointXYZI>);
            pcl::PointCloud<pcl::PointXYZI>::Ptr pSubMap2(new pcl::PointCloud<pcl::PointXYZI>);
            for (uint32_t i = 0; i < dt.size(); i++)
            {
                x = center_x + dt[i];
                for (uint32_t j = 0; j < dt.size(); j++)
                {
                    y = center_y + dt[j];
                    string str = std::to_string(x) + "_" + std::to_string(y);
                    if (submap_name.find(str) != submap_name.end())
                    {
                        string path = submap_path_ + "/" + str + ".pcd";
                        pcl::io::loadPCDFile<pcl::PointXYZI>(path, *tmp);
                        *pSubMap2 += *tmp;
                    }
                }
            }

            pSubMap2->height = 1;
            pSubMap2->width = pSubMap2->points.size();

            map_centerx = center_x;
            map_centery = center_y;

            pclomp::NormalDistributionsTransform<pcl::PointXYZI, pcl::PointXYZI> anh_ndt2;
            anh_ndt2.setResolution(1.0);
            anh_ndt2.setMaximumIterations(10);
            anh_ndt2.setStepSize(0.1);
            anh_ndt2.setTransformationEpsilon(0.01);
            anh_ndt2.setInputTarget(pSubMap2);
            anh_ndt2.setNumThreads(4);
            anh_ndt2.setNeighborhoodSearchMethod(pclomp::DIRECT7);

            mtx.lock();
            TicToc t_input;
            printf("points num : %ld \n", pSubMap->points.size());
            pcl::copyPointCloud(*pSubMap2, *pSubMap);
            anh_ndt = anh_ndt2;
            printf("points num : %ld, ndt input : %.2lf \n", pSubMap->points.size(), t_input.toc());
            mtx.unlock();
        }
    }

    void map_visulization()
    {
        ros::Rate rate(1);
        while (ros::ok())
        {
            rate.sleep();

            if (!init)
            {
                sensor_msgs::PointCloud2 Map2;
                pcl::toROSMsg(*pMap, Map2);
                Map2.header.stamp = ros::Time::now();
                Map2.header.frame_id = "/map";
                pubMap.publish(Map2);
            }
            else
            {
                mtx.lock();
                sensor_msgs::PointCloud2 SubMap2;
                pcl::toROSMsg(*pSubMap, SubMap2);
                mtx.unlock();
                SubMap2.header.stamp = ros::Time::now();
                SubMap2.header.frame_id = "/map";
                pubSubMap.publish(SubMap2);
            }
        }
    }

    void pose_visulization()
    {
        sensor_msgs::PointCloud2 Rslidar2;
        pcl::toROSMsg(*pRslidarDS, Rslidar2);
        Rslidar2.header.stamp = msgLidarTime;
        Rslidar2.header.frame_id = "/rslidar";
        pubRsLidar.publish(Rslidar2);

        geometry_msgs::PoseStamped odom;
        odom.pose.orientation.x = q_lidar.x();
        odom.pose.orientation.y = q_lidar.y();
        odom.pose.orientation.z = q_lidar.z();
        odom.pose.orientation.w = q_lidar.w();
        odom.pose.position.x = t_lidar(0);
        odom.pose.position.y = t_lidar(1);
        odom.pose.position.z = t_lidar(2);
        odom.header.frame_id = "/map";
        odom.header.stamp = Rslidar2.header.stamp;
        pubOdom.publish(odom);

        path.poses.push_back(odom);
        path.header.frame_id = "/map";
        path.header.stamp = Rslidar2.header.stamp;
        pubPath.publish(path);

        transform.setOrigin(tf::Vector3(t_lidar(0), t_lidar(1), t_lidar(2)));
        q.setW(q_lidar.w());
        q.setX(q_lidar.x());
        q.setY(q_lidar.y());
        q.setZ(q_lidar.z());
        transform.setRotation(q);
        br.sendTransform(tf::StampedTransform(transform, Rslidar2.header.stamp, "/map", "/rslidar"));
    }

private:
    ros::NodeHandle nh_;

    // config
    std::string map_path_;
    std::string pcd_path_;
    std::string submap_path_;
    std::string key_frames_path_;
    std::string keypose_path_;
    std::string sc_path_;
    std::string sc_test_path;

    std::string odo_topic_name_;
    std::string imu_topic_name_;

    bool use_sc_;

    bool init;
    Eigen::Vector3d t_lidar;
    Eigen::Quaterniond q_lidar;
    Eigen::Vector3d t_lidar_last;
    Eigen::Quaterniond q_lidar_last;
    double pose_x;
    double pose_y;

    double lidar_time;
    double lidar_time_last;
    double pose_dt;
    double pose_dt_last;

    // imu
    imu_data imu_cur;

    Eigen::Quaterniond q_imu;
    Eigen::Vector3d t_imu;
    Eigen::Vector3d gravity;

    // Voxel
    pcl::VoxelGrid<pcl::PointXYZI> downSizeFilter_25;
    pcl::VoxelGrid<pcl::PointXYZI> downSizeFilter_50;

    // Pointcloud
    pcl::PointCloud<pcl::PointXYZI>::Ptr pRslidarRaw;
    pcl::PointCloud<pcl::PointXYZI>::Ptr pRslidar;
    pcl::PointCloud<pcl::PointXYZI>::Ptr pRslidarDS;
    pcl::PointCloud<pcl::PointXYZI>::Ptr pMap;
    pcl::PointCloud<pcl::PointXYZI>::Ptr pSubMap;
    bool NewPointCloud;

    // ndt
    pclomp::NormalDistributionsTransform<pcl::PointXYZI, pcl::PointXYZI> anh_ndt;
    pcl::PointCloud<pcl::PointXYZI>::Ptr palign;
    // ros sub and pub
    ros::Subscriber subLaserCloudRaw;
    ros::Subscriber subInitPose;
    ros::Subscriber subImu;

    ros::Publisher pubOdom;
    ros::Publisher pubImuOdom;
    ros::Publisher pubTwist;
    ros::Publisher pubPath;
    ros::Publisher pubImuPath;
    ros::Publisher pubRsLidar;
    ros::Publisher pubMap;
    ros::Publisher pubSubMap;

    ros::Time msgLidarTime;

    tf::TransformBroadcaster br;
    tf::Transform transform;
    tf::Quaternion q;

    nav_msgs::Path path;
    nav_msgs::Path imu_path;

    // SubMap
    set<string>::iterator it;
    set<string> submap_name;

    int map_centerx;
    int map_centery;

    // Keypose
    pcl::KdTreeFLANN<pcl::PointXYZ>::Ptr kdtreeSurroundingKeyPoses;
    vector<Eigen::Quaterniond, Eigen::aligned_allocator<Eigen::Quaterniond>> keypose_q;
    vector<Eigen::Vector3d, Eigen::aligned_allocator<Eigen::Vector3d>> keypose_t;

    // sc
    SCManager sc;
    vector<Eigen::Quaternion<double>> sc_q;
    vector<Eigen::Vector3d> sc_t;

    // thead & mtx;
    std::mutex mtx;
    std::mutex mtx_p;
    std::mutex mtx_imu;
};

int main(int argc, char **argv)
{
    ros::init(argc, argv, "location");
    ros::NodeHandle nh;

    location LO(nh);
    std::thread submap_thread(&location::generate_matchcloud, &LO);
    std::thread visu_thread(&location::map_visulization, &LO);
    std::thread lidar_thread(&location::LidarHandle, &LO);

    ros::Rate rate(100);
    while (ros::ok())
    {
        ros::spinOnce();
        rate.sleep();
    }

    submap_thread.join();
    visu_thread.join();

    return 0;
}