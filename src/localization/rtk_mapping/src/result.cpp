#include <geometry_msgs/PoseStamped.h>
#include <fstream>
#include <string>
#include <ros/ros.h>
#include <eigen3/Eigen/Dense>
#include <stdio.h>
using namespace std;

char end1 = 0x0d; // "/n"
char end2 = 0x0a;

FILE *fp = NULL;

void OdmrecordHandle(const geometry_msgs::PoseStamped::ConstPtr &Odometry)
{
    fprintf(fp, "%.3lf %.3lf %.3lf %.3lf %.5lf %.5lf %.5lf %.5lf%c",
            Odometry->header.stamp.toSec(), Odometry->pose.position.x, Odometry->pose.position.y, Odometry->pose.position.z,
            Odometry->pose.orientation.x, Odometry->pose.orientation.y, Odometry->pose.orientation.z, Odometry->pose.orientation.w, end2);
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "recordresult");
    ros::NodeHandle nh;

    string rtk_tum_file = "/home/zsj/dataset/location2.txt";
    fp = fopen(rtk_tum_file.c_str(), "w+");

    if (fp == NULL)
    {
        printf("fail to open file (rtk odometry file) ! \n");
        exit(1);
    }
    else
        printf("TUM : write rtk data to %s \n", rtk_tum_file.c_str());

    ros::Subscriber Odmrecord = nh.subscribe<geometry_msgs::PoseStamped>("/imu_odometry", 200, OdmrecordHandle);
    ros::spin();
    fclose(fp);
    return 0;
}