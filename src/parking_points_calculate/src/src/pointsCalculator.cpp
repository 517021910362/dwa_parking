#include <vector>
#include <cmath>
#include "pointsCalculator.h"

#define PI 3.1415926

pointsCalculator::pointsCalculator()
{
    nh.getParam("/vehicleLength", L);
    nh.getParam("/vehicleWidth", W);
    nh.getParam("/wheelBase", vehicleWheelbase);
    nh.getParam("/minTurnRadius", minTurnRadius);
    nh.getParam("/angleChosen1", alpha1);
    nh.getParam("/angleChosen2", alpha2);
    nh.getParam("/pointC2lineP1P2", D);
    nh.getParam("/vehicleCenter2lineP1P2", dd);
    nh.getParam("/parkingWidth", parkingWidth);
    nh.getParam("/back2lidar", backtolidar);
    alpha1 = alpha1 * PI / 180;
    alpha2 = alpha2 * PI / 180;

    pubDwaTargetPointA = nh.advertise<geometry_msgs::PointStamped>("/dwa_target_pointA", 1, true);
    pubDwaTargetHeadingA = nh.advertise<geometry_msgs::PointStamped>("/dwa_target_headingA", 1, true);
    pubDwaTargetPointB = nh.advertise<geometry_msgs::PointStamped>("/dwa_target_pointB", 1, true);
    pubDwaTargetHeadingB = nh.advertise<geometry_msgs::PointStamped>("/dwa_target_headingB", 1, true);
    pubDwaTargetPointC = nh.advertise<geometry_msgs::PointStamped>("/dwa_target_pointC", 1, true);
    pubDwaTargetHeadingC = nh.advertise<geometry_msgs::PointStamped>("/dwa_target_headingC", 1, true);
    pubDwaTargetPointD = nh.advertise<geometry_msgs::PointStamped>("/dwa_target_pointD", 1, true);
    pubDwaTargetHeadingD = nh.advertise<geometry_msgs::PointStamped>("/dwa_target_headingD", 1, true);
    pubParkingSpace = nh.advertise<sensor_msgs::PointCloud>("/space_point", 1, true);
    pubDwaDirection = nh.advertise<std_msgs::Int8>("/dwa_direction", 1, true);
    pubPredictTime = nh.advertise<std_msgs::Float32>("/dwa_predict_time", 1, true);
    pubState = nh.advertise<std_msgs::Int8>("/dwa_state", 1, true);
    pubLotType = nh.advertise<std_msgs::Int8>("/dwa_lot_type", 1, true);

    pubDwaTargetPoint = nh.advertise<geometry_msgs::PointStamped>("/dwa_target_point", 1, true);
    pubDwaTargetHeading = nh.advertise<geometry_msgs::PointStamped>("/dwa_target_heading", 1, true);

    subParkingSpacePoint = nh.subscribe("/parking_lots_local", 1, &pointsCalculator::CallbackParkingSpaccPoint, this);
    subCurrentBehavior = nh.subscribe("/current_behavior", 1, &pointsCalculator::CallbackCurrentBehavior, this);

    predictTime.data = 5.0;
    ParkingSpacePoint.reset(new sensor_msgs::PointCloud());

    state = 0;
    isRightLot = false;
    decidedLeftOrRight = false;
    receivePoints = false;
    lotType = 0;
    isOccupied = 0;
    // currentBehavior = 0;
    currentBehavior = 16;
}

void pointsCalculator::calculate()
{
    if (currentBehavior != 16)
        return;

    std::vector<geometry_msgs::Point32> ParkingSpacePoints;

    /* -------------------------------- self test ------------------------------- */
    // ParkingSpacePoints.resize(2);
    // // ParkingSpacePoints = ParkingSpacePoint->points;
    // ParkingSpacePoints[0].x = 12.0;
    // ParkingSpacePoints[0].y = 1.5;
    // ParkingSpacePoints[1].x = 10.0;
    // ParkingSpacePoints[1].y = 2.5;
    // sensor_msgs::PointCloud msg;
    // msg.points = ParkingSpacePoints;
    // msg.header.frame_id = "rslidar";
    // msg.header.stamp = ros::Time::now();
    // pubParkingSpace.publish(msg);

    /* ------------------------------ test callback ----------------------------- */

    {
        std::lock_guard<std::mutex> lock(mut);
        if (ParkingSpacePoint == nullptr || ParkingSpacePoint->points.empty())
            return;
        ParkingSpacePoints = ParkingSpacePoint->points;
    }
    // {
    //     std::lock_guard<std::mutex> lock(mut);
    //     if (ParkingSpacePoint.points.empty())
    //         return;
    //     ParkingSpacePoints = ParkingSpacePoint.points;
    // }

    float theta = 0.0;
    if (lotType == 0)
        alpha = alpha1;
    else
        alpha = alpha2;

    if (!isRightLot)
    {
        theta = atan2((ParkingSpacePoints[0].y - ParkingSpacePoints[1].y), (ParkingSpacePoints[0].x - ParkingSpacePoints[1].x));
        theta = PI + theta;
        // theta = theta;
        // printf("theta: %f \n", theta);
    }
    else
        theta = atan2((ParkingSpacePoints[0].y - ParkingSpacePoints[1].y), (ParkingSpacePoints[0].x - ParkingSpacePoints[1].x));
    // if (lotType == 1)
    // {
    //     theta = theta + PI;
    // }
    float center_x, center_y;
    if (lotType == 0)
    {
        center_x = (ParkingSpacePoints[0].x + ParkingSpacePoints[1].x) / 2.0;
        center_y = (ParkingSpacePoints[0].y + ParkingSpacePoints[1].y) / 2.0;
    }
    else
    {
        center_x = ParkingSpacePoints[0].x;
        center_y = ParkingSpacePoints[0].y;
    }
    // printf("center: %f, %f \n", center_x, center_y);
    float ParkingSpaceWidth = sqrt(pow(ParkingSpacePoints[0].x - ParkingSpacePoints[1].x, 2) + pow(ParkingSpacePoints[0].y - ParkingSpacePoints[1].y, 2));
    // if (abs(ParkingSpaceWidth - parkingWidth) > 0.5)
    //     return;

    float d = (parkingWidth - W) / 2.0;
    float R2 = (minTurnRadius + dd + D) / sin(alpha) - minTurnRadius;
    float farRoad = R2 * sin(alpha) + L * cos(alpha) + W / 2 * sin(alpha) - D;
    float left = D * D + pow(R2 - d - W / 2, 2);
    float right = pow(R2 - W / 2, 2);

    geometry_msgs::PointStamped dwaTargetPointA;
    geometry_msgs::PointStamped dwaTargetHeadingA;
    geometry_msgs::PointStamped dwaTargetPointB;
    geometry_msgs::PointStamped dwaTargetHeadingB;
    geometry_msgs::PointStamped dwaTargetPointC;
    geometry_msgs::PointStamped dwaTargetHeadingC;
    geometry_msgs::PointStamped dwaTargetPointD;
    geometry_msgs::PointStamped dwaTargetHeadingD;
    // geometry_msgs::PointStamped dwaTargetPlusPointB;
    // if (left < right && farRoad <= 8)
    if (1)
    {
        float A_x, A_y, A_center_x, A_center_y, A_heading_x, A_heading_y;
        float B_x, B_y, B_center_x, B_center_y, B_heading_x, B_heading_y;
        float C_x, C_y, C_center_x, C_center_y, C_heading_x, C_heading_y;
        float D_center_x, D_center_y, D_heading_x, D_heading_y;
        if (lotType == 0)
        {
            //以P1P2的中点作为该坐标系原点，x轴为P1->P2，y轴为垂直于P1P2向车位外
            C_x = 0.0;
            C_y = -D;
            /* --------------------------------- ground --------------------------------- */
            C_center_x = C_x - 0.6;                  // add -1.0 20211102
            C_center_y = C_y + backtolidar + (-2.0); // add 3.0 20211102 4.0 -1.0

            /* ------------------------------- underground ------------------------------ */
            // C_center_x = C_x - 0.6;
            // C_center_y = C_y + backtolidar + (-1.0); // add 3.0 20211102 4.0 -1.0

            C_heading_x = C_center_x;
            C_heading_y = C_center_y + 1.0;
            B_x = 0.0;
            B_y = 0.0;
            B_center_x = 0.0;
            B_center_y = 0.0;
            B_heading_x = 0.0;
            B_heading_y = 0.0;
            //  B_plus_x = 0.0; // 为了车辆在B点的朝向能更好，尚未测试；
            //  B_plus_y = 0.0;
            A_x = 0.0;
            A_y = 0.0;
            A_center_x = 0.0;
            A_center_y = 0.0;
            A_heading_x = 0.0;
            A_heading_y = 0.0;
            // if (ParkingSpacePoints[0].y >= 0)
            if (!isRightLot)
            {
                A_x = (R2 + minTurnRadius) * cos(alpha) - R2 - 0.0;

                /* --------------------------------- ground --------------------------------- */
                A_y = (R2 + minTurnRadius) * sin(alpha) - minTurnRadius - D - 1.0; // 0.0

                /* ------------------------------- underground ------------------------------ */
                // A_y = (R2 + minTurnRadius) * sin(alpha) - minTurnRadius - D - 0.0; // 0.0

                A_center_x = A_x - backtolidar;
                A_center_y = A_y;
                A_heading_x = A_center_x - 1.0;
                A_heading_y = A_center_y;
                B_x = A_x - minTurnRadius * cos(alpha);
                B_y = R2 * sin(alpha) - D;
                // B_center_x = B_x - sin(alpha) * backtolidar;
                // B_center_y = B_y + cos(alpha) * backtolidar;
                B_center_x = B_x - sin(alpha) * (backtolidar - 1.2);
                B_center_y = B_y + cos(alpha) * (backtolidar - 1.2);
                B_center_x = B_center_x - 3.0;
                B_heading_x = B_center_x - sin(alpha) * 1.0;
                B_heading_y = B_center_y + cos(alpha) * 1.0;

                // B_plus_x = B_center_x - sin(alpha) * (-1.0);
                // B_plus_y = B_center_y + cos(alpha) * (-1.0);
            }
            else
            {
                A_x = -((R2 + minTurnRadius) * cos(alpha) - R2);
                A_y = (R2 + minTurnRadius) * sin(alpha) - minTurnRadius - D;
                A_center_x = A_x + backtolidar;
                A_center_y = A_y;
                A_heading_x = A_center_x + 1.0;
                A_heading_y = A_center_y;
                B_x = A_x + minTurnRadius * cos(alpha);
                B_y = R2 * sin(alpha) - D;
                B_center_x = B_x + sin(alpha) * backtolidar;
                B_center_y = B_y + cos(alpha) * backtolidar;
                B_heading_x = B_center_x + sin(alpha) * 1.0;
                B_heading_y = B_center_y + cos(alpha) * 1.0;

                // B_plus_x = B_center_x + sin(alpha) * (-1.0);
                // B_plus_y = B_center_y + cos(alpha) * (-1.0);
            }
            printf("A: %f, %f; \n B: %f, %f; \n C: %f, %f; \n", A_x, A_y, B_x, B_y, C_x, C_y);

            /* --------------------------------- ground --------------------------------- */
            // D_center_x = -0.2;
            // D_center_y = C_center_y - 1.25; // 2.3 4.0 4.5

            /* ------------------------------- underground ------------------------------ */
            // D_center_x = 0.2;
            // D_center_y = C_center_y - 1.75; // 2.3 4.0 4.5

            /* ----------------------------------- SIT ---------------------------------- */
            D_center_x = -0.2;
            D_center_y = C_center_y - 2.5; // 2.3 4.0 4.5
 
            D_heading_x = D_center_x;
            D_heading_y = D_center_y + 1;

 
        }
        else
        {
            /*
           *  最简单的两个圆弧拼接模型
           *  需要三个轨迹点，包括圆弧起点，两个圆弧交界点，以及圆弧终点
           */

            //   计算参数初始化（可变化）
            // minTurnRadius = 8;            //  转弯半径（在这里重新设定，如果写入yaml则可以删掉此处）
            float back2wheel = 0.0;       //  车尾到后轴的距离，一般计算时根据后轴计算而非车尾,可取0.95
            float d_L = 0.5;              //  车身到车位左侧的距离
            float d_R = 0;                //  车身到车为右侧的距离
            float d_rear = 0.0;           //  车尾到车位后端的安全距离（倒库）
            float R2 = minTurnRadius + 1; //  可进行设定，一般要考虑边界限制
            float d_front = 0.0;          //  车身到车位前段的距离（入库）

            //  由于侧方停车导致的参数变化（暂未写入yaml文件中）

            float parkingLength = 7.0; //  实际上侧方车位要更长一些，经网站查询为6m，  7.0
                                       //  https://zhuanlan.zhihu.com/p/94540430

            //  不可变变量声明
            //  以车位左上角为原点，x轴为左上角指向右上角
            C_x = d_L + W / 2;
            C_y = d_rear - parkingLength;
            C_center_x = C_x - 1.0; // -0.5
            C_center_y = C_y + backtolidar + 1.0;
            C_heading_x = C_center_x;
            C_heading_y = C_center_y + 1.0;
            B_x = 0.0;
            B_y = 0.0;
            B_center_x = 0.0;
            B_center_y = 0.0;
            B_heading_x = 0.0;
            B_heading_y = 0.0;
            A_x = 0.0;
            A_y = 0.0;
            A_center_x = 0.0;
            A_center_y = 0.0;
            A_heading_x = 0.0;
            A_heading_y = 0.0;
            D_center_x = C_center_x;
            D_center_y = C_center_y - 4.0; // 2.3
            D_heading_x = D_center_x;
            D_heading_y = D_center_y + 1;
            //flag_adjust = false;                          //  用于后续调整

            //  用于dwa规划的点
            geometry_msgs::PointStamped dwaTargetPointA; //  倒库起点A
            geometry_msgs::PointStamped dwaTargetHeadingA;
            geometry_msgs::PointStamped dwaTargetPointB; //  拼接点B
            geometry_msgs::PointStamped dwaTargetHeadingB;
            geometry_msgs::PointStamped dwaTargetPointC; //  内圆弧终点C
            geometry_msgs::PointStamped dwaTargetHeadingC;
            //  原则上不需要第四个点，但为了避免你更改其他位置，因此仅仅声明但不进行使用
            geometry_msgs::PointStamped dwaTargetPointD; //  不需要第四个点（入库可能需要）
            geometry_msgs::PointStamped dwaTargetHeadingD;

            //  进行转弯拐点碰撞检测（暂时不考虑）

            // isRightLot = false;

            //  计算相应的坐标
            //  侧方泊车倒库的坐标计算
            // printf("倒库停车...\n");
            theta = theta + PI;

            //  考虑第四个点的情况
            D_center_x = C_center_x + 0.3;
            // D_center_y = -d_front - L + backtolidar;
            D_center_y = C_center_y + 1.5;
            D_heading_x = D_center_x;
            D_heading_y = D_center_y + 1.0;

            if (!isRightLot)
            {
                // printf("left side parking lot\n");
                C_center_x = C_heading_x = C_x = parkingWidth - d_R - W / 2;
                B_x = C_x + minTurnRadius * (1 - cos(alpha));
                B_y = C_y + minTurnRadius * sin(alpha);
                B_center_x = B_x + sin(alpha) * backtolidar;
                B_center_y = B_y + cos(alpha) * backtolidar;
                B_heading_x = B_center_x + sin(alpha) * (1.0);
                B_heading_y = B_center_y + cos(alpha) * (1.0);
                A_x = C_x + (R2 + minTurnRadius) * (1 - cos(alpha));
                A_y = C_y + (R2 + minTurnRadius) * sin(alpha);
                A_center_x = A_x ;
                A_center_y = A_y + backtolidar + 1.0;
                A_heading_x = A_center_x;
                A_heading_y = A_center_y + 1.0;
            }
            else
            {
                // printf("right side parking lot\n");
                B_x = C_x - minTurnRadius * (1 - cos(alpha));
                B_y = C_y + minTurnRadius * sin(alpha);
                B_center_x = B_x - sin(alpha) * backtolidar + 0.4 - 0.8;//负为向左移
                B_center_y = B_y + cos(alpha) * backtolidar - 0.4;
                // B_center_x = B_x - sin(alpha) * backtolidar;
                // B_center_y = B_y + cos(alpha) * backtolidar;
                B_heading_x = B_center_x - sin(alpha) * (1.0);
                B_heading_y = B_center_y + cos(alpha) * (1.0);
                A_x = C_x - (R2 + minTurnRadius) * (1 - cos(alpha));
                A_y = C_y + (R2 + minTurnRadius) * sin(alpha);
                A_center_x = A_x;
                A_center_y = A_y + backtolidar;
                A_heading_x = A_center_x;
                A_heading_y = A_center_y + 1.0;
            }
        }
        dwaTargetPointA.header.frame_id = "rslidar";
        dwaTargetPointA.header.stamp = ros::Time::now();
        dwaTargetHeadingA.header = dwaTargetPointA.header;
        dwaTargetPointB.header.frame_id = "rslidar";
        dwaTargetPointB.header.stamp = ros::Time::now();
        dwaTargetHeadingB.header = dwaTargetPointB.header;
        // dwaTargetPlusPointB.header = dwaTargetPointB.header;

        dwaTargetPointC.header.frame_id = "rslidar";
        dwaTargetPointC.header.stamp = ros::Time::now();
        dwaTargetHeadingC.header = dwaTargetPointC.header;
        dwaTargetPointD.header.frame_id = "rslidar";
        dwaTargetPointD.header.stamp = ros::Time::now();
        dwaTargetHeadingD.header = dwaTargetPointD.header;

        dwaTargetPointA.point.x = A_center_x * cos(theta) - A_center_y * sin(theta) + center_x;
        dwaTargetPointA.point.y = A_center_x * sin(theta) + A_center_y * cos(theta) + center_y;
        float disA = sqrt(pow(dwaTargetPointA.point.x, 2) + pow(dwaTargetPointA.point.y, 2));
        dwaTargetHeadingA.point.x = A_heading_x * cos(theta) - A_heading_y * sin(theta) + center_x;
        dwaTargetHeadingA.point.y = A_heading_x * sin(theta) + A_heading_y * cos(theta) + center_y;
        dwaTargetHeadingA.point.z = dwaTargetPointA.point.z = ParkingSpacePoints[0].z;

        dwaTargetPointB.point.x = B_center_x * cos(theta) - B_center_y * sin(theta) + center_x;
        dwaTargetPointB.point.y = B_center_x * sin(theta) + B_center_y * cos(theta) + center_y;
        float disB = sqrt(pow(dwaTargetPointB.point.x, 2) + pow(dwaTargetPointB.point.y, 2));
        dwaTargetHeadingB.point.x = B_heading_x * cos(theta) - B_heading_y * sin(theta) + center_x;
        dwaTargetHeadingB.point.y = B_heading_x * sin(theta) + B_heading_y * cos(theta) + center_y;
        dwaTargetHeadingB.point.z = dwaTargetPointB.point.z = ParkingSpacePoints[0].z;

        dwaTargetPointC.point.x = C_center_x * cos(theta) - C_center_y * sin(theta) + center_x;
        dwaTargetPointC.point.y = C_center_x * sin(theta) + C_center_y * cos(theta) + center_y;
        float disC = sqrt(pow(dwaTargetPointC.point.x, 2) + pow(dwaTargetPointC.point.y, 2));
        dwaTargetHeadingC.point.x = C_heading_x * cos(theta) - C_heading_y * sin(theta) + center_x;
        dwaTargetHeadingC.point.y = C_heading_x * sin(theta) + C_heading_y * cos(theta) + center_y;
        dwaTargetHeadingC.point.z = dwaTargetPointC.point.z = ParkingSpacePoints[0].z;

        dwaTargetPointD.point.x = D_center_x * cos(theta) - D_center_y * sin(theta) + center_x;
        dwaTargetPointD.point.y = D_center_x * sin(theta) + D_center_y * cos(theta) + center_y;
        float disD = sqrt(pow(dwaTargetPointD.point.x, 2) + pow(dwaTargetPointD.point.y, 2));
        dwaTargetHeadingD.point.x = D_heading_x * cos(theta) - D_heading_y * sin(theta) + center_x;
        dwaTargetHeadingD.point.y = D_heading_x * sin(theta) + D_heading_y * cos(theta) + center_y;
        dwaTargetHeadingD.point.z = dwaTargetPointD.point.z = ParkingSpacePoints[0].z;

        pubDwaTargetPointA.publish(dwaTargetPointA);
        pubDwaTargetHeadingA.publish(dwaTargetHeadingA);
        pubDwaTargetPointB.publish(dwaTargetPointB);
        pubDwaTargetHeadingB.publish(dwaTargetHeadingB);
        pubDwaTargetPointC.publish(dwaTargetPointC);
        pubDwaTargetHeadingC.publish(dwaTargetHeadingC);
        pubDwaTargetPointD.publish(dwaTargetPointD);
        pubDwaTargetHeadingD.publish(dwaTargetHeadingD);

        if (lotType == 0)
        {
            if (state == 0)
            {
                pubDwaTargetPoint.publish(dwaTargetPointA);
                pubDwaTargetHeading.publish(dwaTargetHeadingA);

                predictTime.data = (5.0) * std::min(pow(disA / 10.6f, 0.5), 1.0);
                pubPredictTime.publish(predictTime);

                std_msgs::Int8 dir;
                dir.data = 1;
                pubDwaDirection.publish(dir);

                if (disA < 0.3)
                    state = 1;
            }
            if (state == 1)
            {
                pubDwaTargetPoint.publish(dwaTargetPointB);
                pubDwaTargetHeading.publish(dwaTargetHeadingB);

                predictTime.data = 5.0 * std::min(disB / 4.20f, 1.0f);
                pubPredictTime.publish(predictTime);

                std_msgs::Int8 dir;
                dir.data = 1;
                pubDwaDirection.publish(dir);

                if (disB < 0.5)
                    state = 2;
            }
            if (state == 2)
            {
                pubDwaTargetPoint.publish(dwaTargetPointC);
                pubDwaTargetHeading.publish(dwaTargetHeadingC);

                predictTime.data = 4.0 * std::min(disC / 5.0f, 1.0f); // 4.65
                pubPredictTime.publish(predictTime);

                std_msgs::Int8 dir;
                dir.data = -1;
                pubDwaDirection.publish(dir);

                if (disC < 1.5)
                    state = 3;
            }
            if (state == 3)
            {
                pubDwaTargetPoint.publish(dwaTargetPointD);
                pubDwaTargetHeading.publish(dwaTargetHeadingD);

                predictTime.data = 3.0 * std::min(disD / 4.0f, 1.0f);
                pubPredictTime.publish(predictTime);

                std_msgs::Int8 dir;
                dir.data = -1;
                pubDwaDirection.publish(dir);

                if (disD < 1.5)
                    state = 4;
            }
            if (state == 4)
            {
                std_msgs::Int8 dir;
                dir.data = 0;
                pubDwaDirection.publish(dir);
            }
        }
        else
        {
            if (state == 0)
            {
                pubDwaTargetPoint.publish(dwaTargetPointA);
                pubDwaTargetHeading.publish(dwaTargetHeadingA);

                predictTime.data = (5.0) * std::min(pow(disA / 10.6f, 0.5), 1.0);
                pubPredictTime.publish(predictTime);

                std_msgs::Int8 dir;
                dir.data = 1;
                pubDwaDirection.publish(dir);

                if (disA < 0.3)
                    state = 1;
            }
            if (state == 1)
            {
                pubDwaTargetPoint.publish(dwaTargetPointB);
                pubDwaTargetHeading.publish(dwaTargetHeadingB);

                predictTime.data = 3.0 * std::min(disB / 3.94f, 1.0f);
                pubPredictTime.publish(predictTime);

                std_msgs::Int8 dir;
                dir.data = -1;
                pubDwaDirection.publish(dir);

                if (disB < 0.5)
                    state = 2;
            }
            if (state == 2)
            {
                pubDwaTargetPoint.publish(dwaTargetPointC);
                pubDwaTargetHeading.publish(dwaTargetHeadingC);

                predictTime.data = 3.0 * std::min(disC / 5.0f, 1.0f); // 4.0
                pubPredictTime.publish(predictTime);

                std_msgs::Int8 dir;
                dir.data = -1;
                pubDwaDirection.publish(dir);

                if (disC < 0.4)
                    state = 3;
            }

            if (state == 3)
            {
                pubDwaTargetPoint.publish(dwaTargetPointD);
                pubDwaTargetHeading.publish(dwaTargetHeadingD);

                predictTime.data = 1.0 * std::min(disD / 2.0f, 1.0f);
                pubPredictTime.publish(predictTime);

                std_msgs::Int8 dir;
                dir.data = 1;
                pubDwaDirection.publish(dir);

                if (disD < 0.5)
                    state = 4;
            }

            if (state == 4)
            {
                std_msgs::Int8 dir;
                dir.data = 0;
                pubDwaDirection.publish(dir);
            }
        }
        std_msgs::Int8 stateMsg;
        stateMsg.data = state;
        pubState.publish(stateMsg);
        std_msgs::Int8 lotTypeMsg;
        lotTypeMsg.data = lotType;
        pubLotType.publish(lotTypeMsg);
    }
    else
    {
        if (left >= right)
        {
            printf("B to C will collide with the back of the car!!!");
        }
        if (farRoad > 8)
        {
            printf("A to B will collide with the front of the car!!!");
        }
    }
}

void pointsCalculator::CallbackParkingSpaccPoint(const parking_lot_msgs::parking_lots::Ptr &lots)
{
    if (!lots->parking_lots.empty())
    {
        geometry_msgs::Point32 p1, p2, p3, p4;
        p1.x = lots->parking_lots[0].corner_left_upper.x;
        p1.y = lots->parking_lots[0].corner_left_upper.y;
        p2.x = lots->parking_lots[0].corner_right_upper.x;
        p2.y = lots->parking_lots[0].corner_right_upper.y;
        p3.x = lots->parking_lots[0].corner_left_low.x;
        p3.y = lots->parking_lots[0].corner_left_low.y;
        p4.x = lots->parking_lots[0].corner_right_low.x;
        p4.y = lots->parking_lots[0].corner_right_low.y;
        ParkingSpacePoint->points.clear();
        ParkingSpacePoint->points.push_back(p1);
        ParkingSpacePoint->points.push_back(p2);
        ParkingSpacePoint->points.push_back(p3);
        ParkingSpacePoint->points.push_back(p4);
        isOccupied = lots->parking_lots[0].is_occupied;
        lotType = lots->parking_lots[0].type;
        if (lotType == 0)
        {
            if (!decidedLeftOrRight)
            {
                isRightLot = (ParkingSpacePoint->points[2].y <= ParkingSpacePoint->points[0].y) ? true : false;
                decidedLeftOrRight = true;
                printf("Deciding......parkingLot is on %d side\n", isRightLot);
            }
        }
        else
            isRightLot = true;
    }
}

void pointsCalculator::CallbackCurrentBehavior(const geometry_msgs::TwistStamped &beh)
{
    currentBehavior = beh.twist.angular.y;
}