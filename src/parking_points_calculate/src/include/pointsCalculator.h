#ifndef POINTS_CALCULATOR_H
#define POINTS_CALCULATOR_H

#include <ros/ros.h>
#include <iostream>
#include <sensor_msgs/PointCloud.h>
#include <geometry_msgs/PointStamped.h>
#include <geometry_msgs/Point32.h>
#include <geometry_msgs/TwistStamped.h>
#include <std_msgs/Int8.h>
#include <std_msgs/Float32.h>
#include <geometry_msgs/Point.h>
#include <parking_lot_msgs/parking_lots.h>
#include <vector>
#include <mutex>

class pointsCalculator
{
public:
    pointsCalculator();
    ~pointsCalculator() { };
    
    void calculate();

private:
    void CallbackParkingSpaccPoint(const parking_lot_msgs::parking_lots::Ptr &lots);
    void CallbackCurrentBehavior(const geometry_msgs::TwistStamped &beh);
    
private:
    ros::NodeHandle nh;
    ros::Subscriber subParkingSpacePoint;
    ros::Subscriber subCurrentBehavior;
    ros::Publisher pubDwaTargetPointA;
    ros::Publisher pubDwaTargetHeadingA;
    ros::Publisher pubDwaTargetPointB;
    ros::Publisher pubDwaTargetHeadingB;
    ros::Publisher pubDwaTargetPointC;
    ros::Publisher pubDwaTargetHeadingC;
    ros::Publisher pubDwaTargetPointD;
    ros::Publisher pubDwaTargetHeadingD;
    ros::Publisher pubParkingSpace;
    ros::Publisher pubDwaTargetPoint;
    ros::Publisher pubDwaTargetHeading;
    ros::Publisher pubDwaDirection;
    ros::Publisher pubPredictTime;
    ros::Publisher pubState;
    ros::Publisher pubLotType;

    float L;
    float W;
    float vehicleWheelbase;
    float minTurnRadius;
    float alpha1;
    float alpha2;
    float alpha;
    float D;
    float dd;
    float parkingWidth;
    float backtolidar;
    int state;
    int lotType;
    int isOccupied;
    bool isRightLot;
    bool decidedLeftOrRight;
    bool receivePoints;
    std_msgs::Float32 predictTime;
    int currentBehavior;
    
    sensor_msgs::PointCloud::Ptr ParkingSpacePoint;
    std::mutex mut;
};

#endif