#include <iostream>
#include <ros/ros.h>
#include "pointsCalculator.h"

int main(int argc, char** argv)
{
    ros::init(argc, argv, "calculator");
    ros::Time::init();
    ros::Rate loop_rate(10);

    pointsCalculator calculator;
    while (ros::ok())
    {
        ros::spinOnce();
        calculator.calculate();
        loop_rate.sleep();
    }
    return 0;
}