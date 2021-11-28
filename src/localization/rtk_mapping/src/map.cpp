#include <rosbag/bag.h>
#include <rosbag/view.h>
#include <ros/ros.h>

#include <sensor_msgs/PointCloud2.h>
#include <location_msgs/RTK.h>

#include <boost/foreach.hpp>
#include <unistd.h>
#include <string>

#include <mutex>
#include <thread>
#include <chrono>

#include <ndt_cpu/NormalDistributionsTransform.h>
#include <pcl/kdtree/kdtree_flann.h>

#include "func.h"
#include "tic_toc.h"

#include <gtsam/geometry/Rot3.h>
#include <gtsam/geometry/Pose3.h>
#include <gtsam/slam/PriorFactor.h>
#include <gtsam/slam/BetweenFactor.h>
#include <gtsam/nonlinear/NonlinearFactorGraph.h>
#include <gtsam/nonlinear/LevenbergMarquardtOptimizer.h>
#include <gtsam/nonlinear/Marginals.h>
#include <gtsam/nonlinear/Values.h>

#include <gtsam/nonlinear/ISAM2.h>

#include "Scancontext.h"

using namespace gtsam;

#define foreach BOOST_FOREACH

class MapOptimization
{
    EIGEN_MAKE_ALIGNED_OPERATOR_NEW
public:
    MapOptimization(ros::NodeHandle nh) : nh_(nh)
    {
        // load params from launch
        nh_.getParam("bag_path", bag_path);
        nh_.getParam("map_path", map_path);
        nh_.getParam("save_map", save_map);
        nh_.getParam("q_t_imu2lidar", q_t_imu2lidar);
        nh_.getParam("map_dist", map_dist);
        nh_.getParam("submap_size", submap_size);
        sc_path = map_path + "/sc_map";
        key_frames_path = map_path + "/key_frames";

        //ros
        pubMap = nh.advertise<sensor_msgs::PointCloud2>("/map", 2);
        pubOdom = nh.advertise<geometry_msgs::PoseStamped>("/odometry", 5);
        pubPath = nh.advertise<nav_msgs::Path>("/path", 1);

        //TODO init form q_t_imu2lidar
        R_imu2lidar = Eigen::AngleAxisd(-M_PI / 2, Eigen::Vector3d::UnitZ()) *
                      Eigen::AngleAxisd(0, Eigen::Vector3d::UnitY()) *
                      Eigen::AngleAxisd(0, Eigen::Vector3d::UnitX());
        q_imu2lidar = R_imu2lidar;
        q_lidar2imu = R_imu2lidar.transpose();
        t_in_imu = Eigen::Vector3d(0, 2, 0);
        t_in_lidar = Eigen::Vector3d(-2, 0, 0);

        //pointcloud init
        pLaserCloud.reset(new pcl::PointCloud<pcl::PointXYZI>());
        pLaserCloudDS.reset(new pcl::PointCloud<pcl::PointXYZI>());
        pMapCloud.reset(new pcl::PointCloud<pcl::PointXYZI>());
        pMapCloudDS.reset(new pcl::PointCloud<pcl::PointXYZI>());
        pTargetCloud.reset(new pcl::PointCloud<pcl::PointXYZI>());
        pSourceCloud.reset(new pcl::PointCloud<pcl::PointXYZI>());
        pRSTargetCloud.reset(new pcl::PointCloud<pcl::PointXYZI>());

        kdtreeSurroundingKeyPoses.reset(new pcl::KdTreeFLANN<pcl::PointXYZI>());

        //pose init
        cloudKeyPoses3D.reset(new pcl::PointCloud<pcl::PointXYZI>());
        rtkKeyPoses3D.reset(new pcl::PointCloud<pcl::PointXYZI>());
        q_lidar_last = Eigen::Quaterniond(1, 0, 0, 0);
        t_lidar_last = Eigen::Vector3d(0, 0, 0);

        q_lidar = Eigen::Quaterniond(1, 0, 0, 0);
        t_lidar = Eigen::Vector3d(0, 0, 0);

        q_ndt = Eigen::Quaterniond(1, 0, 0, 0);
        t_ndt = Eigen::Vector3d(0, 0, 0);

        q_sam = Eigen::Quaterniond(1, 0, 0, 0);
        t_sam = Eigen::Vector3d(0, 0, 0);

        currentPose.x = 0;
        currentPose.y = 0;
        currentPose.z = 0;
        currentPose.intensity = 0;

        //Voxel grid init
        downSizeFilter_50.setLeafSize(0.5, 0.5, 0.5);
        downSizeFilter_25.setLeafSize(0.25, 0.25, 0.25);

        //gtsam
        ISAM2Params parameters;
        parameters.relinearizeThreshold = 0.01;
        parameters.relinearizeSkip = 1;
        isam = new ISAM2(parameters);

        gtsam::Vector Vector1(6);
        Vector1 << 1e-6, 1e-6, 1e-6, 1e-3, 1e-3, 1e-3; // rotation xyz
        odometryNoise = noiseModel::Diagonal::Variances(Vector1);

        gtsam::Vector Vector2(6);
        Vector2 << 1e-12, 1e-12, 1e-12, 1e-12, 1e-12, 1e-12;
        priorNoise = noiseModel::Diagonal::Variances(Vector2);

        //ndt
        anh_ndt.setResolution(1.0);
        anh_ndt.setMaximumIterations(50);
        anh_ndt.setStepSize(0.1);
        anh_ndt.setTransformationEpsilon(0.01);

        //other init
        odometry_time = 0;
        loopClosure_time = 0;
        latestFrameID = -1;
        RSclosestHistoryFrameID = -1;
        dist = map_dist;

        //manul params
        surroundingKeyframeSearchRadius = 10;
        recentKeyFramesNum = 10;

        //debug
        close_index = 0;
    }

    void getRtkPose()
    {
        rosbag::Bag bag;
        bag.open(bag_path, rosbag::bagmode::Read);

        std::vector<std::string> topics;
        topics.push_back(std::string("/rtk_data"));
        rosbag::View view(bag, rosbag::TopicQuery(topics));

        foreach (rosbag::MessageInstance const m, view)
        {
            std::string topic = m.getTopic();

            location_msgs::RTK::ConstPtr pRtk = m.instantiate<location_msgs::RTK>();
            if (pRtk != NULL)
                pose_manager.rtk_data_in(*pRtk);
        }
        bag.close();
    }

    template <class Matrix>
    void write_matrix(const char *filename, const Matrix &matrix)
    {
        std::ofstream out(filename, std::ios::out | std::ios::binary | std::ios::trunc);
        typename Matrix::Index rows = matrix.rows(), cols = matrix.cols();
        out.write((char *)(&rows), sizeof(typename Matrix::Index));
        out.write((char *)(&cols), sizeof(typename Matrix::Index));
        out.write((char *)matrix.data(), rows * cols * sizeof(typename Matrix::Scalar));
        out.close();
    }

    template <class datatype>
    void write_vector(const char *filename, const std::vector<datatype> &vec)
    {
        std::ofstream out(filename, std::ios::out | std::ios::binary | std::ios::trunc);
        int num = vec.size();
        out.write((char *)(&num), sizeof(int));
        out.write((char *)vec.data(), num * sizeof(datatype));
        out.close();
    }

    void extractSurroundingKeyFrames()
    {
        bool new_target_cloud = false;

        if (cloudKeyPoses3D->points.empty() == true)
        {
            return;
        }

        if (recentCloudKeyFrames.size() < recentKeyFramesNum)
        {
            if (latestFrameID != cloudKeyPoses3D->points.size() - 1)
            {
                latestFrameID = cloudKeyPoses3D->points.size() - 1;
                recentCloudKeyFrames.push_back(transformPointCloud(pointcloud_q[latestFrameID], pointcloud_t[latestFrameID], CloudKeyFrames[latestFrameID]));
                new_target_cloud = true;
            }
        }
        else
        {
            if (latestFrameID != cloudKeyPoses3D->points.size() - 1)
            {
                recentCloudKeyFrames.pop_front();
                latestFrameID = cloudKeyPoses3D->points.size() - 1;
                recentCloudKeyFrames.push_back(transformPointCloud(pointcloud_q[latestFrameID], pointcloud_t[latestFrameID], CloudKeyFrames[latestFrameID]));
                new_target_cloud = true;
            }
        }

        if (!new_target_cloud)
            return;

        //printf("generate new ndt target pointcloud !!! \n");
        //generate new ndt target pointcloud
        pcl::PointCloud<pcl::PointXYZI>::Ptr tmp(new pcl::PointCloud<pcl::PointXYZI>());
        for (int i = 0; i < recentCloudKeyFrames.size(); i++)
            *tmp += *recentCloudKeyFrames[i];

        downSizeFilter_50.setInputCloud(tmp);
        downSizeFilter_50.filter(*pTargetCloud);
        anh_ndt.setInputTarget(pTargetCloud);
    }

    bool saveKeyFrame()
    {
        if (dist < map_dist)
            return false;

        dist -= map_dist;

        if (cloudKeyPoses3D->points.empty() == true)
        {
            gtSAMgraph.add(PriorFactor<Pose3>(0, Pose3(Rot3(q_ndt), Point3(t_ndt)), priorNoise));
            initialEstimate.insert(0, Pose3(Rot3(q_ndt), Point3(t_ndt)));
        }
        else
        {
            Eigen::Quaterniond q_last = pointcloud_q[pointcloud_q.size() - 1];
            Eigen::Vector3d t_last = pointcloud_t[pointcloud_t.size() - 1];

            gtsam::Pose3 poseFrom = Pose3(Rot3(q_last), Point3(t_last));
            gtsam::Pose3 poseTo = Pose3(Rot3(q_ndt), Point3(t_ndt));

            gtSAMgraph.add(BetweenFactor<Pose3>(cloudKeyPoses3D->points.size() - 1, cloudKeyPoses3D->points.size(), poseFrom.between(poseTo), odometryNoise));
            initialEstimate.insert(cloudKeyPoses3D->points.size(), Pose3(Rot3(q_ndt), Point3(t_ndt)));
        }

        //update iSAM
        isam->update(gtSAMgraph, initialEstimate);
        isam->update();

        gtSAMgraph.resize(0);
        initialEstimate.clear();

        //save result
        Pose3 latestEstimate;

        isamCurrentEstimate = isam->calculateEstimate();
        latestEstimate = isamCurrentEstimate.at<Pose3>(isamCurrentEstimate.size() - 1);
        q_sam = latestEstimate.rotation().matrix();
        t_sam(0) = latestEstimate.translation().x();
        t_sam(1) = latestEstimate.translation().y();
        t_sam(2) = latestEstimate.translation().z();
        printf("      **** \n");
        printf("delta: %.2lf, %.2lf, %.2lf\n", t_sam(0) - t_ndt(0), t_sam(1) - t_ndt(1), t_sam(2) - t_ndt(2));

        q_ndt = q_sam;
        t_ndt = t_sam;

        pointcloud_q.push_back(q_ndt);
        pointcloud_t.push_back(t_ndt);
        pointcloud_time.push_back(odometry_time);
        currentPose.x = t_ndt(0);
        currentPose.y = t_ndt(1);
        currentPose.z = t_ndt(2);
        currentPose.intensity = pointcloud_q.size() - 1;
        cloudKeyPoses3D->points.push_back(currentPose);

        rtk_q.push_back(q_lidar);
        rtk_t.push_back(t_lidar);
        pcl::PointXYZI rtkcurrentPose;
        rtkcurrentPose.x = t_lidar(0);
        rtkcurrentPose.y = t_lidar(1);
        rtkcurrentPose.z = t_lidar(2);
        rtkKeyPoses3D->points.push_back(rtkcurrentPose);

        pcl::PointCloud<pcl::PointXYZI>::Ptr thisKeyFrame(new pcl::PointCloud<pcl::PointXYZI>());
        pcl::copyPointCloud(*pLaserCloud, *thisKeyFrame);
        CloudKeyFrames.push_back(thisKeyFrame);

        scmanager.makeAndSaveScancontextAndKeys(*thisKeyFrame);
        SaveScanContext();
        
        pcl::PointCloud<pcl::PointXYZI>::Ptr thisKeyFrameDS(new pcl::PointCloud<pcl::PointXYZI>());
        downSizeFilter_50.setInputCloud(thisKeyFrame);
        downSizeFilter_50.filter(*thisKeyFrameDS);
        thisKeyFrameDS->height = 1;
        thisKeyFrameDS->width = thisKeyFrameDS->points.size();
        std::string key_frames_pcd = sc_path + "/" + std::to_string(CloudKeyFrames.size()) + ".pcd";
        pcl::io::savePCDFileASCII(key_frames_pcd, *thisKeyFrameDS);
        printf("save keyframe pcd at : %s \n", key_frames_pcd.c_str());

        printf("save keyframe %ld !!! \n", pointcloud_q.size() - 1);
        printf("t_ndt: %.2lf, %.2lf, %.2lf\n", t_ndt(0), t_ndt(1), t_ndt(2));
        printf("t_lidar: %.2lf, %.2lf, %.2lf\n", t_lidar(0), t_lidar(1), t_lidar(2));

        return true;
    }

    void mapping()
    {
        rosbag::Bag bag;
        bag.open(bag_path, rosbag::bagmode::Read);

        std::vector<std::string> topics;
        topics.push_back(std::string("/rslidar_points"));
        rosbag::View view(bag, rosbag::TopicQuery(topics));

        foreach (rosbag::MessageInstance const m, view)
        {
            std::string topic = m.getTopic();

            sensor_msgs::PointCloud2::ConstPtr pcloud = m.instantiate<sensor_msgs::PointCloud2>();
            if (pcloud != NULL)
            {
                Eigen::Quaternion<double> tmp_q(1, 0, 0, 0);
                Eigen::Vector3d tmp_t(0, 0, 0);
                odometry_time = pcloud->header.stamp.toSec();
                bool interp = pose_manager.get_pose(odometry_time, tmp_q, tmp_t);

                if (!interp)
                    break;

                q_lidar = q_imu2lidar * tmp_q * q_lidar2imu;
                t_lidar = q_imu2lidar.matrix() * (tmp_q.matrix() * t_in_imu + tmp_t) + t_in_lidar;

                //keep point in range min ~ max
                pcl::PointCloud<pcl::PointXYZI>::Ptr tmp(new pcl::PointCloud<pcl::PointXYZI>());
                pcl::fromROSMsg(*pcloud, *tmp);
                pointcloud_in_range(5, 100, tmp, pLaserCloud);

                if (cloudKeyPoses3D->points.empty() == true)
                {
                    q_ndt = q_lidar;
                    t_ndt = t_lidar;
                }
                else
                {
                    Eigen::Matrix4f trans(Eigen::Matrix4f::Identity());
                    //guess pose
                    Eigen::Vector3d t_guess = t_ndt + t_lidar - t_lidar_last;
                    Eigen::Quaterniond q_guess = q_lidar * q_lidar_last.conjugate() * q_ndt;
                    Eigen::Translation3d init_translation(t_guess(0), t_guess(1), t_guess(2));
                    Eigen::AngleAxisd init_rotation(q_guess);
                    Eigen::Matrix4d init_guess = (init_translation * init_rotation) * Eigen::Matrix4d::Identity();

                    TicToc time_ndt;
                    //downsample
                    downSizeFilter_25.setInputCloud(pLaserCloud);
                    downSizeFilter_25.filter(*pSourceCloud);

                    anh_ndt.setInputSource(pSourceCloud);
                    anh_ndt.align(init_guess.cast<float>());

                    trans = anh_ndt.getFinalTransformation();

                    Eigen::Vector3d dt(trans(0, 3), trans(1, 3), trans(2, 3));
                    Eigen::Matrix3d dR;
                    dR << trans(0, 0), trans(0, 1), trans(0, 2), trans(1, 0), trans(1, 1), trans(1, 2), trans(2, 0), trans(2, 1), trans(2, 2);

                    q_ndt = Eigen::Quaterniond(dR);
                    t_ndt = dt;

                    // printf("ndt time: %.2f ms, iteration : %d\n", time_ndt.toc(), anh_ndt.getFinalNumIteration());
                    dist += sqrt((t_lidar(0) - t_lidar_last(0)) * (t_lidar(0) - t_lidar_last(0)) + (t_lidar(1) - t_lidar_last(1)) * (t_lidar(1) - t_lidar_last(1)));
                }

                q_lidar_last = q_lidar;
                t_lidar_last = t_lidar;
                currentPose.x = t_ndt(0);
                currentPose.y = t_ndt(1);
                currentPose.z = t_ndt(2);

                //TicToc time_save;
                bool newKeyFrame = saveKeyFrame();
                // printf("savaKeyFrame : %.2lf ms \n", time_save.toc());

                if (newKeyFrame)
                {
                    //TicToc time_LoopClosure;
                    detectLoopClosure();
                    // printf("LoopClosure  : %.2lf ms \n", time_LoopClosure.toc());
                }

                //TicToc time_extract;
                extractSurroundingKeyFrames();
                // printf("extractFrame : %.2lf ms \n", time_extract.toc());

                printf("x : %.2lf, y : %.2lf, z : %.2lf, dist : %.2lf  \n", t_ndt(0), t_ndt(1), t_ndt(2), dist);
                if (newKeyFrame)
                    visulization();

                if (!ros::ok())
                    break;
            }
        }
        bag.close();
        printf("mapping finished !\n");
    }

    void visulization()
    {
        geometry_msgs::PoseStamped odom;
        odom.pose.orientation.x = q_ndt.x();
        odom.pose.orientation.y = q_ndt.y();
        odom.pose.orientation.z = q_ndt.z();
        odom.pose.orientation.w = q_ndt.w();
        odom.pose.position.x = t_ndt(0);
        odom.pose.position.y = t_ndt(1);
        odom.pose.position.z = t_ndt(2);
        odom.header.frame_id = "/map";
        odom.header.stamp = ros::Time::now();
        pubOdom.publish(odom);

        path.poses.push_back(odom);
        path.header.frame_id = "/map";
        path.header.stamp = odom.header.stamp;
        pubPath.publish(path);

        sensor_msgs::PointCloud2 TargetCloud2;
        pcl::toROSMsg(*pTargetCloud, TargetCloud2);
        TargetCloud2.header.stamp = odom.header.stamp;
        TargetCloud2.header.frame_id = "/map";
        pubMap.publish(TargetCloud2);
    }

    void saveMap()
    {
        printf("wait a second ... \n");
        printf("final map visulization ... \n");
        string map_pcd = map_path + "/map.pcd";
        string submap_path = map_path + "/submap";

        pcl::PointCloud<pcl::PointXYZI>::Ptr pSaveMap(new pcl::PointCloud<pcl::PointXYZI>());
        pcl::PointCloud<pcl::PointXYZI>::Ptr pSaveMapDS(new pcl::PointCloud<pcl::PointXYZI>());

        for (int i = 0; i < cloudKeyPoses3D->points.size(); i++)
            *pSaveMap += *transformPointCloud(pointcloud_q[i], pointcloud_t[i], CloudKeyFrames[i]);

        downSizeFilter_50.setInputCloud(pSaveMap);
        downSizeFilter_50.filter(*pSaveMapDS);

        pSaveMapDS->height = 1;
        pSaveMapDS->width = pSaveMapDS->points.size();

        sensor_msgs::PointCloud2 FinalMap2;
        pcl::toROSMsg(*pSaveMapDS, FinalMap2);
        FinalMap2.header.stamp = ros::Time().now();
        FinalMap2.header.frame_id = "/map";
        pubMap.publish(FinalMap2);

        printf("saving TUM format... \n");
        saveTUMformat();

        if (!save_map)
        {
            printf("88 \n");
            return;
        }

        printf("saving map ... \n");
        pcl::io::savePCDFileASCII(map_pcd, *pSaveMapDS);
        printf("save map pcd at %s \n", map_pcd.c_str());

        map<string, pcl::PointCloud<pcl::PointXYZI>::Ptr> map_name_cloud;
        map<string, pcl::PointCloud<pcl::PointXYZI>::Ptr>::iterator it;
        for (uint32_t i = 0; i < pSaveMapDS->points.size(); i++)
        {
            double px = pSaveMapDS->points[i].x;
            double py = pSaveMapDS->points[i].y;

            int x = floor(px / submap_size);
            int y = floor(py / submap_size);

            string str = std::to_string(x) + "_" + std::to_string(y);

            it = map_name_cloud.find(str);

            if (it != map_name_cloud.end())
            {
                pcl::PointCloud<pcl::PointXYZI>::Ptr tmp = it->second;
                tmp->points.push_back(pSaveMapDS->points[i]);
            }

            else
            {
                pcl::PointCloud<pcl::PointXYZI>::Ptr tmp(new pcl::PointCloud<pcl::PointXYZI>);
                tmp->points.push_back(pSaveMapDS->points[i]);
                map_name_cloud.insert(std::pair<string, pcl::PointCloud<pcl::PointXYZI>::Ptr>(str, tmp));
            }
        }

        // to pcd file
        for (it = map_name_cloud.begin(); it != map_name_cloud.end(); it++)
        {
            string str = it->first;
            string submap_pcd = submap_path + "/" + str + ".pcd";

            pcl::PointCloud<pcl::PointXYZI>::Ptr tmp = it->second;
            tmp->height = 1;
            tmp->width = tmp->points.size();

            pcl::io::savePCDFileASCII(submap_pcd, *tmp);
            printf("save submap pcd at : %s \n", submap_pcd.c_str());
        }
        printf("map save ~~~\n 88 \n");
    }

    void detectLoopClosure()
    {
        pRSTargetCloud->clear();
        RSclosestHistoryFrameID = -1;

        std::vector<int> pointSearchInd;
        std::vector<float> pointSearchSqDis;
        kdtreeSurroundingKeyPoses->setInputCloud(rtkKeyPoses3D);
        pcl::PointXYZI searchPose;
        searchPose.x = t_lidar(0);
        searchPose.y = t_lidar(1);
        searchPose.z = t_lidar(2);
        kdtreeSurroundingKeyPoses->radiusSearch(searchPose, surroundingKeyframeSearchRadius, pointSearchInd, pointSearchSqDis, 0);

        int curMinID = 1000000;
        for (int i = 0; i < pointSearchInd.size(); i++)
        {
            int id = pointSearchInd[i];
            // TODO
            if (abs(pointcloud_time[id] - odometry_time) <= 60)
                continue;

            if (id < curMinID)
            {
                curMinID = id;
                RSclosestHistoryFrameID = curMinID;
            }
        }

        if (RSclosestHistoryFrameID == -1)
            return;

        // if (abs(odometry_time - loopClosure_time) <= 30)
        // {
        //     printf("loop time check failed: %.3lf - %.3lf \n", odometry_time, loopClosure_time);
        //     return;
        // }

        int current_id = pointcloud_q.size() - 1;
        printf("detect loop closure id : %d-%d !!! \n", current_id, RSclosestHistoryFrameID);
        pcl::PointCloud<pcl::PointXYZI>::Ptr tmp(new pcl::PointCloud<pcl::PointXYZI>());
        for (int j = -recentKeyFramesNum / 2; j <= recentKeyFramesNum / 2; j++)
        {
            int id = RSclosestHistoryFrameID + j;
            if (id < 0 || id > cloudKeyPoses3D->points.size() - 1)
                continue;
            printf("add id %d pointcloud to RSTargetCloud \n", id);
            *tmp += *transformPointCloud(pointcloud_q[id], pointcloud_t[id], CloudKeyFrames[id]);
        }

        downSizeFilter_50.setInputCloud(tmp);
        downSizeFilter_50.filter(*pRSTargetCloud);

        pcl::PointCloud<pcl::PointXYZI>::Ptr pRSSourceCloud(new pcl::PointCloud<pcl::PointXYZI>());
        pRSSourceCloud = transformPointCloud(pointcloud_q[current_id], pointcloud_t[current_id], CloudKeyFrames[current_id]);

        // debug
        // save candidate pointcloud to pcd
        // string source_pcd = map_path + "/debug_map/" + to_string(close_index) + "_" + to_string(current_id) +"_source.pcd";
        // string target_pcd = map_path + "/debug_map/" + to_string(close_index) + "_" + to_string(RSclosestHistoryFrameID) +"_target.pcd";
        // pcl::io::savePCDFileASCII(source_pcd, *pRSSourceCloud);
        // pcl::io::savePCDFileASCII(target_pcd, *pRSTargetCloud);
        // close_index++;

        cpu::NormalDistributionsTransform<pcl::PointXYZI, pcl::PointXYZI> ndt;
        ndt.setResolution(1);
        ndt.setMaximumIterations(500);
        ndt.setStepSize(0.1);
        ndt.setTransformationEpsilon(0.01);
        ndt.setInputSource(pRSSourceCloud);
        ndt.setInputTarget(pRSTargetCloud);

        Eigen::Matrix4f trans(Eigen::Matrix4f::Identity());
        Eigen::Quaterniond q_guess(1, 0, 0, 0);
        Eigen::Vector3d t_guess = (pointcloud_t[RSclosestHistoryFrameID] - pointcloud_t[current_id]) - (rtk_t[RSclosestHistoryFrameID] - rtk_t[current_id]);
        printf("q_guess: %.2lf, %.2lf, %.2lf, %.2lf\n", q_guess.x(), q_guess.y(), q_guess.z(), q_guess.w());
        printf("t_guess: %.2lf, %.2lf, %.2lf\n", t_guess(0), t_guess(1), t_guess(2));
        Eigen::Translation3d init_translation(t_guess(0), t_guess(1), t_guess(2));
        Eigen::AngleAxisd init_rotation(q_guess);
        Eigen::Matrix4d init_guess = (init_translation * init_rotation) * Eigen::Matrix4d::Identity();
        ndt.align(init_guess.cast<float>());

        trans = ndt.getFinalTransformation();
        printf("%.4f, %.4f, %.4f, %.4f \n", trans(0, 0), trans(0, 1), trans(0, 2), trans(0, 3));
        printf("%.4f, %.4f, %.4f, %.4f \n", trans(1, 0), trans(1, 1), trans(1, 2), trans(1, 3));
        printf("%.4f, %.4f, %.4f, %.4f \n", trans(2, 0), trans(2, 1), trans(2, 2), trans(2, 3));
        printf("%.4f, %.4f, %.4f, %.4f \n", trans(3, 0), trans(3, 1), trans(3, 2), trans(3, 3));

        Eigen::Vector3d dt(trans(0, 3), trans(1, 3), trans(2, 3));
        Eigen::Matrix3d dR;
        dR << trans(0, 0), trans(0, 1), trans(0, 2), trans(1, 0), trans(1, 1), trans(1, 2), trans(2, 0), trans(2, 1), trans(2, 2);

        Eigen::Quaterniond q_lc = Eigen::Quaterniond(dR);
        Eigen::Vector3d t_lc = dt;

        //ndt result
        double fitness_score = ndt.getFitnessScore();
        printf("loop closure ndt result : \n");
        printf("hasConverged : %d\n", ndt.hasConverged());
        printf("iteration : %d\n", ndt.getFinalNumIteration());
        printf("fitness_score : %f\n", fitness_score);
        printf("trans_probability :%f\n", ndt.getTransformationProbability());

        //score check
        if (fitness_score > 0.6)
        {
            printf("bad match !!! \n");
            return;
        }

        loopClosure_time = odometry_time;

        float noiseScore = 0.5; //TODO
        gtsam::Vector Vector6(6);
        Vector6 << noiseScore, noiseScore, noiseScore, noiseScore, noiseScore, noiseScore;
        constraintNoise = noiseModel::Diagonal::Variances(Vector6);
        robustNoiseModel = gtsam::noiseModel::Robust::Create(
            gtsam::noiseModel::mEstimator::Cauchy::Create(1), // optional: replacing Cauchy by DCS or GemanMcClure
            gtsam::noiseModel::Diagonal::Variances(Vector6));

        Eigen::Quaterniond q_target = pointcloud_q[RSclosestHistoryFrameID];
        Eigen::Vector3d t_target = pointcloud_t[RSclosestHistoryFrameID];

        Eigen::Quaterniond q_check = q_lc * pointcloud_q[current_id];
        Eigen::Vector3d t_check = q_lc * pointcloud_t[current_id] + t_lc;

        printf("before : %.2lf, %.2lf, %.2lf \n", t_ndt(0), t_ndt(1), t_ndt(2));
        printf("check  : %.2lf, %.2lf, %.2lf \n", t_check(0), t_check(1), t_check(2));

        gtsam::Pose3 poseFrom = Pose3(Rot3(q_check), Point3(t_check));
        gtsam::Pose3 poseTo = Pose3(Rot3(q_target), Point3(t_target));

        gtSAMgraph.add(BetweenFactor<Pose3>(current_id, RSclosestHistoryFrameID, poseFrom.between(poseTo), robustNoiseModel));

        isam->update(gtSAMgraph);
        isam->update();
        isam->update();
        isam->update();
        isam->update();
        isam->update();
        isamCurrentEstimate = isam->calculateEstimate();
        gtSAMgraph.resize(0);
        initialEstimate.clear();

        //update keyframe match_map
        //keyframe
        int numPoses = isamCurrentEstimate.size();

        for (int i = 0; i < numPoses; i++)
        {
            double x = isamCurrentEstimate.at<Pose3>(i).translation().x();
            double y = isamCurrentEstimate.at<Pose3>(i).translation().y();
            double z = isamCurrentEstimate.at<Pose3>(i).translation().z();

            // printf("%d : %.2lf, %.2lf, %.2lf : %.2lf, %.2lf, %.2lf\n", i, pointcloud_t[i](0), pointcloud_t[i](1), pointcloud_t[i](2), x, y, z);
            pointcloud_q[i] = isamCurrentEstimate.at<Pose3>(i).rotation().matrix();
            pointcloud_t[i](0) = x;
            pointcloud_t[i](1) = y;
            pointcloud_t[i](2) = z;

            cloudKeyPoses3D->points[i].x = x;
            cloudKeyPoses3D->points[i].y = y;
            cloudKeyPoses3D->points[i].z = z;

            if (i < numPoses - 1)
            {
                path.poses[i].pose.orientation.x = pointcloud_q[i].x();
                path.poses[i].pose.orientation.y = pointcloud_q[i].y();
                path.poses[i].pose.orientation.z = pointcloud_q[i].z();
                path.poses[i].pose.orientation.w = pointcloud_q[i].w();
                path.poses[i].pose.position.x = x;
                path.poses[i].pose.position.y = y;
                path.poses[i].pose.position.z = z;
            }
        }

        currentPose.x = isamCurrentEstimate.at<Pose3>(numPoses - 1).translation().x();
        currentPose.y = isamCurrentEstimate.at<Pose3>(numPoses - 1).translation().y();
        currentPose.z = isamCurrentEstimate.at<Pose3>(numPoses - 1).translation().z();
        Eigen::Quaterniond q_tmp = pointcloud_q[current_id];
        Eigen::Vector3d t_tmp = pointcloud_t[current_id];
        q_ndt = q_tmp;
        t_ndt = t_tmp;
        printf("sam : %.2lf, %.2lf, %.2lf\n", currentPose.x, currentPose.y, currentPose.z);

        //match_map
        recentCloudKeyFrames.clear();
        for (int i = 0; i < recentKeyFramesNum; i++)
        {
            int id = numPoses - 1 - i;
            if (id >= 0)
                recentCloudKeyFrames.push_front(transformPointCloud(pointcloud_q[id], pointcloud_t[id], CloudKeyFrames[id]));
        }
        latestFrameID = cloudKeyPoses3D->points.size() - 1;

        //printf("generate new ndt target pointcloud !!! \n");
        //generate new ndt target pointcloud
        pcl::PointCloud<pcl::PointXYZI>::Ptr tmp2(new pcl::PointCloud<pcl::PointXYZI>());
        for (int i = 0; i < recentCloudKeyFrames.size(); i++)
            *tmp2 += *recentCloudKeyFrames[i];

        downSizeFilter_50.setInputCloud(tmp2);
        downSizeFilter_50.filter(*pTargetCloud);
        anh_ndt.setInputTarget(pTargetCloud);
    }

    bool SaveScanContext()
    {
        std::string file_path = key_frames_path + "/scan_context_" + std::to_string(CloudKeyFrames.size()) + "_";
        write_matrix((file_path + "polarcontexts").c_str(), scmanager.polarcontexts_.back());
        write_matrix((file_path + "polarcontext_invkeys").c_str(), scmanager.polarcontext_invkeys_.back());
        write_matrix((file_path + "polarcontext_vkeys").c_str(), scmanager.polarcontext_vkeys_.back());
        write_vector((file_path + "polarcontext_invkeys_mat").c_str(), scmanager.polarcontext_invkeys_mat_.back());
        return true;
    }

    void saveTUMformat()
    {
        char end1 = 0x0d; // "/n"
        char end2 = 0x0a;

        // rtk odometry
        FILE *fp = NULL;

        string rtk_tum_file = map_path + "/rtk.txt";
        fp = fopen(rtk_tum_file.c_str(), "w+");

        if (fp == NULL)
        {
            printf("fail to open file (rtk odometry file) ! \n");
            exit(1);
        }
        else
            printf("TUM : write rtk data to %s \n", rtk_tum_file.c_str());

        for (int i = 0; i < pose_manager.map_q_.size(); i++)
        {
            Eigen::Quaterniond q = pose_manager.map_q_[i];
            Eigen::Vector3d t = pose_manager.map_t_[i];
            double time = pose_manager.map_time_[i];
            fprintf(fp, "%.3lf %.3lf %.3lf %.3lf %.5lf %.5lf %.5lf %.5lf%c",
                    time, t(0), t(1), t(2),
                    q.x(), q.y(), q.z(), q.w(), end2);
        }

        fclose(fp);

        // lidar odometry
        string lidar_tum_file = map_path + "/lidar.txt";
        fp = fopen(lidar_tum_file.c_str(), "w+");

        if (fp == NULL)
        {
            printf("fail to open file (lidar odometry file) ! \n");
            exit(1);
        }
        else
            printf("TUM : write lidar data to %s \n", lidar_tum_file.c_str());

        for (int i = 0; i < pointcloud_q.size(); i++)
        {
            Eigen::Quaterniond q = pointcloud_q[i];
            Eigen::Vector3d t = pointcloud_t[i];
            double time = pointcloud_time[i];
            fprintf(fp, "%.3lf %.3lf %.3lf %.3lf %.5lf %.5lf %.5lf %.5lf%c",
                    time, t(0), t(1), t(2),
                    q.x(), q.y(), q.z(), q.w(), end2);
        }
        fclose(fp);

        string sc_txt = map_path + "/sc.txt";
        fp = fopen(sc_txt.c_str(), "w+");

        if (fp == NULL)
        {
            printf("fail to open file (sc file)!\n");
            exit(1);
        }
        else
            printf("sc:write sc data to %s \n", sc_txt.c_str());

        for (int i = 0; i < pointcloud_q.size(); i++)
        {
            Eigen::Quaterniond q = pointcloud_q[i];
            Eigen::Vector3d t = pointcloud_t[i];
            fprintf(fp, "%.3lf %.3lf %.3lf %.5lf %.5lf %.5lf %.5lf%c",
                    t(0), t(1), t(2),
                    q.x(), q.y(), q.z(), q.w(), end2);
        }
        fclose(fp);
    }

private:
    //debug
    int close_index;
    //ros
    ros::NodeHandle nh_;

    ros::Publisher pubMap;
    ros::Publisher pubOdom;
    ros::Publisher pubPath;

    nav_msgs::Path path;

    //params from launch
    string map_path;
    string bag_path;
    bool save_map;
    string sc_path;
    string key_frames_path;

    vector<double> q_t_imu2lidar;

    double map_dist; // keyframe dist
    double dist;

    int submap_size;

    //rtk data manager
    rtk_pose pose_manager;

    //calibration
    Eigen::Matrix3d R_imu2lidar;
    Eigen::Quaterniond q_imu2lidar;
    Eigen::Quaterniond q_lidar2imu;
    Eigen::Vector3d t_in_imu;
    Eigen::Vector3d t_in_lidar;

    //pointcloud
    pcl::PointCloud<pcl::PointXYZI>::Ptr pLaserCloud;
    pcl::PointCloud<pcl::PointXYZI>::Ptr pLaserCloudDS;
    pcl::PointCloud<pcl::PointXYZI>::Ptr pMapCloudDS;
    pcl::PointCloud<pcl::PointXYZI>::Ptr pMapCloud;

    pcl::PointCloud<pcl::PointXYZI>::Ptr pTargetCloud;
    pcl::PointCloud<pcl::PointXYZI>::Ptr pSourceCloud;

    vector<pcl::PointCloud<pcl::PointXYZI>::Ptr> CloudKeyFrames;
    deque<pcl::PointCloud<pcl::PointXYZI>::Ptr> recentCloudKeyFrames;
    double recentKeyFramesNum;
    int latestFrameID;

    //keyframe pose
    pcl::PointCloud<pcl::PointXYZI>::Ptr cloudKeyPoses3D;
    pcl::PointXYZI currentPose;
    double odometry_time;
    vector<Eigen::Quaternion<double>> pointcloud_q;
    vector<Eigen::Vector3d> pointcloud_t;
    vector<double> pointcloud_time;

    pcl::PointCloud<pcl::PointXYZI>::Ptr rtkKeyPoses3D;
    vector<Eigen::Quaternion<double>> rtk_q;
    vector<Eigen::Vector3d> rtk_t;

    //pose
    Eigen::Quaternion<double> q_lidar_last;
    Eigen::Vector3d t_lidar_last;
    Eigen::Quaternion<double> q_lidar;
    Eigen::Vector3d t_lidar;

    Eigen::Quaternion<double> q_ndt;
    Eigen::Vector3d t_ndt;

    Eigen::Quaternion<double> q_sam;
    Eigen::Vector3d t_sam;

    //VoxelGrid
    pcl::VoxelGrid<pcl::PointXYZI> downSizeFilter_50;
    pcl::VoxelGrid<pcl::PointXYZI> downSizeFilter_25;

    //ndt
    cpu::NormalDistributionsTransform<pcl::PointXYZI, pcl::PointXYZI> anh_ndt;

    //mutex
    std::mutex mtx;

    //loop closure
    double loopClosure_time;
    int RSclosestHistoryFrameID;
    pcl::PointCloud<pcl::PointXYZI>::Ptr pRSTargetCloud;

    //Kdtree
    pcl::KdTreeFLANN<pcl::PointXYZI>::Ptr kdtreeSurroundingKeyPoses;
    double surroundingKeyframeSearchRadius;

    //gtsam
    NonlinearFactorGraph gtSAMgraph;
    Values initialEstimate;
    Values optimizedEstimate;
    ISAM2 *isam;
    Values isamCurrentEstimate;

    noiseModel::Diagonal::shared_ptr priorNoise;
    noiseModel::Diagonal::shared_ptr odometryNoise;
    noiseModel::Diagonal::shared_ptr constraintNoise;
    noiseModel::Base::shared_ptr robustNoiseModel;

    // sc
    SCManager scmanager;
};

int main(int argc, char **argv)
{
    ros::init(argc, argv, "map");
    ros::NodeHandle nh;

    MapOptimization MO(nh);
    MO.getRtkPose();
    MO.mapping();
    MO.saveMap();

    return 0;
}