#include <ros/ros.h>
#include <sensor_msgs/PointCloud.h>
#include <geometry_msgs/Point32.h>
#include <geometry_msgs/PoseStamped.h>
#include <nav_msgs/OccupancyGrid.h>
#include <parking_lot_msgs/parking_lots.h>

#include <tf/tf.h>
#include <tf/transform_listener.h>
#include <tf/transform_broadcaster.h>

#include <vector>

bool init_pose_flag = false;
void simPoseCallback(const geometry_msgs::PoseStamped &msg)
{
    init_pose_flag = true;
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "traffic_light_simulator");
    ros::NodeHandle nh;

    ros::Publisher parking_lot_corners_pub = nh.advertise<sensor_msgs::PointCloud>("/parking_lot_corners", 1, true);
    ros::Publisher parking_lots_local_pub = nh.advertise<parking_lot_msgs::parking_lots>("/parking_lots_local", 1, true);
    ros::Publisher parking_lots_global_pub = nh.advertise<parking_lot_msgs::parking_lots>("/parking_lots_global", 1, true);
    ros::Publisher empty_ocm_pub = nh.advertise<nav_msgs::OccupancyGrid>("/occupancy_grid_map", 1, true);
    ros::Subscriber sim_pose_sub = nh.subscribe("/dwa_sim_pose", 1, &simPoseCallback);
    tf::TransformListener tf_listener;

    /* -------------------------------------------------------------------------- */
    /*                          comment if no simulation                          */
    /* -------------------------------------------------------------------------- */
    tf::TransformBroadcaster tf_broadcaster;
    
    //sim type = 0
    // geometry_msgs::Point32 left_up;
    // left_up.x = 12.6;
    // left_up.y = 0.5;
    // left_up.z = 0;
    // geometry_msgs::Point32 right_up;
    // right_up.x = 10.0;
    // right_up.y = 0.5;
    // right_up.z = 0;
    // geometry_msgs::Point32 left_bottom;
    // left_bottom.x = 0;
    // left_bottom.y = 0;
    // left_bottom.z = 0;
    // geometry_msgs::Point32 right_bottom;
    // right_bottom.x = 0;
    // right_bottom.y = 0;
    // right_bottom.z = 0;

    //sim type = 1
    // geometry_msgs::Point32 left_up;
    // left_up.x = -10;
    // left_up.y = -3.0;
    // left_up.z = 0;
    // geometry_msgs::Point32 right_up;
    // right_up.x = -10;
    // right_up.y = -5.5;
    // right_up.z = 0;
    // geometry_msgs::Point32 left_bottom;
    // left_bottom.x = -16; // 26
    // left_bottom.y = -3.0;
    // left_bottom.z = 0;
    // geometry_msgs::Point32 right_bottom;
    // right_bottom.x = -16; // 26
    // right_bottom.y = -5.5;
    // right_bottom.z = 0;

    // /* --------------------------------- ground --------------------------------- */
    // geometry_msgs::Point32 left_up;
    // left_up.x = 6.016;
    // left_up.y = 4.855;
    // left_up.z = 0;
    // geometry_msgs::Point32 right_up;
    // right_up.x = 3.415;
    // right_up.y = 4.776;
    // right_up.z = 0;
    // geometry_msgs::Point32 left_bottom;
    // left_bottom.x = 6.075;
    // left_bottom.y = 9.658;
    // left_bottom.z = 0;
    // geometry_msgs::Point32 right_bottom;
    // right_bottom.x = 3.605;
    // right_bottom.y = 9.652;
    // right_bottom.z = 0;

    /* ------------------------------- underground ------------------------------ */
    // geometry_msgs::Point32 left_up;
    // left_up.x = 2.697;
    // left_up.y = -50.471;
    // left_up.z = 0;
    // geometry_msgs::Point32 right_up;location
    // geometry_msgs::Point32 left_bottom;
    // left_bottom.x = 7.142;
    // left_bottom.y = -50.2709;
    // left_bottom.z = 0;
    // geometry_msgs::Point32 right_bottom;
    // right_bottom.x = 7.009;
    // right_bottom.y = -47.796;
    // right_bottom.z = 0;

    /* ------------------------------- fengxian ------------------------------ */
    // geometry_msgs::Point32 left_up;
    // left_up.x = 19.569;
    // left_up.y = 5.255;
    // left_up.z = 0;
    // geometry_msgs::Point32 right_up;
    // right_up.x = 16.811;
    // right_up.y = 5.160;
    // right_up.z = 0;
    // geometry_msgs::Point32 right_bottom;
    // right_bottom.x = 17.287;
    // right_bottom.y = 10.439;
    // right_bottom.z = 0;

    // geometry_msgs::Point32 left_bottom;
    // left_bottom.x = 20.453;
    // left_bottom.y = 10.126;
    // left_bottom.z = 0;

     //lotType 1
    geometry_msgs::Point32 left_up;
    left_up.x = 193.772583008;
    left_up.y = 86.9231567383;
    left_up.z = 0;
    geometry_msgs::Point32 right_up;
    right_up.x = 191.67906189;
    right_up.y = 88.3771286011;
    right_up.z = 0;
    geometry_msgs::Point32 left_bottom;
    left_bottom.x = 197.916213989;
    left_bottom.y = 92.343421936;
    left_bottom.z = 0;
    geometry_msgs::Point32 right_bottom;
    right_bottom.x = 195.916824341;
    right_bottom.y = 93.8910064697;
    right_bottom.z = 0;

    sensor_msgs::PointCloud global_corners;
    global_corners.header.frame_id = "/map";
    global_corners.points.push_back(left_up);
    global_corners.points.push_back(right_up);
    global_corners.points.push_back(left_bottom);
    global_corners.points.push_back(right_bottom);

    parking_lot_msgs::parking_lots init_lots;
    parking_lot_msgs::parking_lot init_lot;
    init_lot.corner_left_upper.x = global_corners.points[0].x;
    init_lot.corner_left_upper.y = global_corners.points[0].y;
    init_lot.corner_left_low.x = global_corners.points[2].x;
    init_lot.corner_left_low.y = global_corners.points[2].y;
    init_lot.corner_right_upper.x = global_corners.points[1].x;
    init_lot.corner_right_upper.y = global_corners.points[1].y;
    init_lot.corner_right_low.x = global_corners.points[3].x;
    init_lot.corner_right_low.y = global_corners.points[3].y;

    init_lot.entrance_center.x = (init_lot.corner_left_upper.x + init_lot.corner_right_upper.x) / 2; //! FOR type = 0, the entrance is upper edge
    init_lot.entrance_center.y = (init_lot.corner_left_upper.y + init_lot.corner_right_upper.y) / 2; //! FOR type = 0, the entrance is upper edge
    init_lot.center.x = (init_lot.corner_left_upper.x + init_lot.corner_left_low.x + init_lot.corner_right_upper.x + init_lot.corner_right_low.x);
    init_lot.center.y = (init_lot.corner_left_upper.y + init_lot.corner_left_low.y + init_lot.corner_right_upper.y + init_lot.corner_right_low.y);

    init_lot.is_occupied = 0;
    init_lot.type = 1; //0 垂直   1 侧方位
    init_lot.header.frame_id = "rslidar";
    init_lots.header.frame_id = "rslidar";
    init_lots.parking_lots.push_back(init_lot);

    ros::Rate loop_rate(10);

    /* -------------------------------------------------------------------------- */
    /*                          comment if no simulation                          */
    /* -------------------------------------------------------------------------- */
    
    tf::StampedTransform init_stamped_transform;
    init_stamped_transform.setOrigin(tf::Vector3(1e-4, 1e-4, 1e-4));
    init_stamped_transform.setRotation(tf::Quaternion(1e-4, 1e-4, 1e-4, 1));
    init_stamped_transform.frame_id_ = "map";
    init_stamped_transform.child_frame_id_ = "rslidar";
    init_stamped_transform.stamp_ = ros::Time::now();
    tf_broadcaster.sendTransform(init_stamped_transform);
    ROS_INFO("parking lot simulator: broadcast transform");

    nav_msgs::OccupancyGrid grid;
    grid.info.height = 100;
    grid.info.width = 100;
    grid.info.origin.position.x = -50;
    grid.info.origin.position.y = -50;
    grid.info.origin.position.z = 0;
    grid.info.origin.orientation.x = 0;
    grid.info.origin.orientation.y = 0;
    grid.info.origin.orientation.z = 0;
    grid.info.origin.orientation.w = 1;
    grid.info.resolution = 1;
    grid.header.frame_id = "rslidar";
    grid.data = std::vector<int8_t>(10000, 0);

    // tf::Quaternion q;

    while (ros::ok())
    {
        ros::spinOnce();
        sensor_msgs::PointCloud local_corners;
        /* ------------------------ comment if no simulation ------------------------ */
        // if (!init_pose_flag)
        // {
        //     init_stamped_transform.stamp_ = ros::Time::now();
        //     tf_broadcaster.sendTransform(init_stamped_transform);

        //     global_corners.header.stamp = ros::Time::now();
        //     parking_lot_corners_pub.publish(global_corners);
        //     parking_lots_pub.publish(init_lots);
        //     grid.header.stamp = ros::Time::now();
        //     empty_ocm_pub.publish(grid);

        //     loop_rate.sleep();
        //     continue;
        // }
        /* ----------------------------------  END  --------------------------------- */
        try
        {
            // ROS_INFO("before simulator transform pc");
            tf_listener.transformPointCloud("rslidar", ros::Time(0), global_corners, "map", local_corners);
            
            // init_stamped_transform.stamp_ = ros::Time::now();
            // tf_broadcaster.sendTransform(init_stamped_transform);
            // ROS_INFO("after  simulator transform pc");
        }
        catch (tf::TransformException &ex)
        {
            ROS_INFO("no transform between rslidar and map");
            ROS_ERROR("simulator: %s", ex.what());
            // init_stamped_transform.stamp_ = ros::Time::now();
            // tf_broadcaster.sendTransform(init_stamped_transform);
            ros::Duration(0.1).sleep();
        }

        /* -------------------- local lots are published for DWA -------------------- */
        parking_lot_msgs::parking_lots lots_local;
        parking_lot_msgs::parking_lot lot_local;
        lot_local.corner_left_upper.x = local_corners.points[0].x;
        lot_local.corner_left_upper.y = local_corners.points[0].y;
        lot_local.corner_left_low.x = local_corners.points[2].x;
        lot_local.corner_left_low.y = local_corners.points[2].y;
        lot_local.corner_right_upper.x = local_corners.points[1].x;
        lot_local.corner_right_upper.y = local_corners.points[1].y;
        lot_local.corner_right_low.x = local_corners.points[3].x;
        lot_local.corner_right_low.y = local_corners.points[3].y;

        lot_local.entrance_center.x = (lot_local.corner_left_upper.x + lot_local.corner_right_upper.x) / 2; //! FOR type = 0, the entrance is upper edge
        lot_local.entrance_center.y = (lot_local.corner_left_upper.y + lot_local.corner_right_upper.y) / 2; //! FOR type = 0, the entrance is upper edge
        lot_local.center.x = (lot_local.corner_left_upper.x + lot_local.corner_left_low.x + lot_local.corner_right_upper.x + lot_local.corner_right_low.x);
        lot_local.center.y = (lot_local.corner_left_upper.y + lot_local.corner_left_low.y + lot_local.corner_right_upper.y + lot_local.corner_right_low.y);

        lot_local.is_occupied = 0;
        lot_local.type = 1; //0 垂直   1 侧方位
        lot_local.header.frame_id = "rslidar";
        lots_local.header.frame_id = "rslidar";
        lots_local.parking_lots.push_back(lot_local);
        parking_lots_local_pub.publish(lots_local);

        
        /* -------------------- global lots are published for behavior -------------------- */
        parking_lot_msgs::parking_lots lots_global;
        parking_lot_msgs::parking_lot lot_global;
        lot_global.corner_left_upper.x = global_corners.points[0].x;
        lot_global.corner_left_upper.y = global_corners.points[0].y;
        lot_global.corner_left_low.x = global_corners.points[2].x;
        lot_global.corner_left_low.y = global_corners.points[2].y;
        lot_global.corner_right_upper.x = global_corners.points[1].x;
        lot_global.corner_right_upper.y = global_corners.points[1].y;
        lot_global.corner_right_low.x = global_corners.points[3].x;
        lot_global.corner_right_low.y = global_corners.points[3].y;

        lot_global.entrance_center.x = (lot_global.corner_left_upper.x + lot_global.corner_right_upper.x) / 2; //! FOR type = 0, the entrance is upper edge
        lot_global.entrance_center.y = (lot_global.corner_left_upper.y + lot_global.corner_right_upper.y) / 2; //! FOR type = 0, the entrance is upper edge
        lot_global.center.x = (lot_global.corner_left_upper.x + lot_global.corner_left_low.x + lot_global.corner_right_upper.x + lot_global.corner_right_low.x);
        lot_global.center.y = (lot_global.corner_left_upper.y + lot_global.corner_left_low.y + lot_global.corner_right_upper.y + lot_global.corner_right_low.y);

        lot_global.is_occupied = 0;
        lot_global.type = 1; //0 垂直   1 侧方位
        lot_global.header.frame_id = "rslidar";
        lots_global.header.frame_id = "rslidar";
        lots_global.parking_lots.push_back(lot_global);
        parking_lots_global_pub.publish(lots_global);

        parking_lot_corners_pub.publish(local_corners);

        grid.header.stamp = ros::Time::now();
        empty_ocm_pub.publish(grid);
        loop_rate.sleep();
    }

    return 0;
}
