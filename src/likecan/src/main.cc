#define CAN_Device USBCAN_E_1CH
#include <ros/ros.h>
#include "CanMsgDefs.h"
#include <iostream>
#include "CanCommonFcn.h"
#include "CanHandler.h"
#include "ICANCmd.h"
#include "math.h"
#include "control_msgs/control_req.h"
#include "std_msgs/Float64.h"
#include "std_msgs/Int8.h"
#include <thread>
#include <mutex>

#include <geometry_msgs/Vector3.h>
#include <geometry_msgs/Twist.h>
#include <geometry_msgs/TwistStamped.h>
using namespace CanProcess;

double g_LastError = 0.0; //定义上一个偏差值
double g_AccumulatedError = 0.0;
double g_PidVoltage = 0.0; //定义控制执行器变量

int g_Direction = 1; //1 - 前进 -1 - 倒退
int g_BreakHandBrakeCount = 0;

// #define DEBUG
char g_KeyBoardInput = '\0';
// int g_KeyBoardInput = 0;
int g_TurningSystemStatus;

int g_TargetGear = 2;
double g_TargetAngle = 0.0;
double g_TargetSpeed = 0.0;
double g_TargetAcceleration = 0.0;

int g_CurrentGear;
double g_CurrentAngle = 0.0;
double g_CurrentSpeed = 0.0;
double g_CurrentAcceleration = 0.0;

int g_LongitudeDrivingStatus = 0;
int g_HandBrakeStatus = 1;

//int g_CurrentBehaviorState = 0;
int g_CurrentBehaviorState = 16;
int remote_control_signal = 0;

std::mutex g_KeyBoardMutex;
std::mutex g_CurrentBehaviorMutex;

//#define FILTER
#ifdef FILTER
// acc filter
double currTargetAccel = 0.0;
double lastTargetAccel = 0.0;
double filterTimeConstant = 0.25;
#endif

void CallbackNormalControlCmd(const control_msgs::control_req::ConstPtr controlCmdMsg);
void CallbackParkingControlCmd(const control_msgs::control_req::ConstPtr controlCmdMsg);
void CallbackCurrentBehavior(const geometry_msgs::TwistStamped::ConstPtr currentBehaviorMsg);

void getKeyBoardInput()
{
    ros::Rate loopRate(50);
    while (1)
    {
        // std::cerr << "waiting for input" << std::endl;brake
        g_KeyBoardInput = getchar();
        int enter = getchar(); // =='\n'
        // std::cerr << "g_KeyBoardInput:" << g_KeyBoardInput << std::endl;
        loopRate.sleep();
    }
}

int main(int argc, char **argv)
{

    ros::init(argc, argv, "CAN");
    ros::NodeHandle n;

    // ros::Subscriber subControlCmd = n.subscribe("dwa_planner/control_cmd", 1, &controlCmdCallback);
    ros::Subscriber subNormalControlCmd = n.subscribe("/normal_control_req", 1, &CallbackNormalControlCmd);
    ros::Subscriber subParkingControlCmd = n.subscribe("/parking_control_req", 1, &CallbackParkingControlCmd);
    ros::Subscriber subCurrentBehavior = n.subscribe("/current_behavior", 1, &CallbackCurrentBehavior);

    ros::Publisher pubSpeedAndAngle = n.advertise<geometry_msgs::TwistStamped>("/current_vehicle_can_info", 1, true);
    ros::Publisher pubCurrentAcceleration = n.advertise<std_msgs::Float64>("/curAccel", 1, true);
    ros::Publisher pubTargetAcceleration = n.advertise<std_msgs::Float64>("/tarAccel", 1, true);
    ros::Publisher pubTargetSpeed = n.advertise<std_msgs::Float64>("/tarSpeed", 1, true);
    ros::Publisher pubVehicleStatus = n.advertise<geometry_msgs::TwistStamped>("/chasis_status", 1, true);

    initRecvMessage();
    initSendMessages();
    CAN_InitConfig CanConfig;
    // 构建 Can Processor
    CanHandler CanIO(CAN_Device, 0, 3, CanConfig);
    DWORD opened;
    // 打开 Can设备
    opened = CanIO.OpenDevice();

    // 获取这几个参数的地址， 用于后续控制发送什么消息
    send_args *send = &sendArg;
    // send_args *send50 = &sendArg50;
    recv_args *recv = &recvArg;
    recv->channel = 0; // 0 是channel 0,，默认为0
    send->channel = 1;

    // 这里可以设置发送进程的间隔， 单位是毫秒上升沿
    send->interval = 20;
    // send50->interval = 5000;

    // 设置上升沿 进入自动加速模型
    if (opened != 0)
    {
        // 第一次发送,发送5次
        send->num_frames = 4;
        send->data = new CAN_DataFrame[send->num_frames];
        send_all_safe(send);
        send->msg_arrived = true;
        ros::Rate r(50);
        for (int i = 0; i < 9; i++)
        {
            send_all_safe(send);
            r.sleep();
        }

        // 第二次发送
        {
            std::unique_lock<std::mutex> lock(CanIO.recv_data_lock);
            g_CurrentAngle = getTurn();
        }
        //LOG(INFO) << "Initial Angle: " << angle << "\n\n";
        setTurn(g_CurrentAngle);
        enterTurn();
        enterDrive();
        enterGear();
        setGear(g_TargetGear); // init gear is N;
        for (int i = 0; i < 9; i++)
        {
            send_all_safe(send);
            r.sleep();
        }
    }

    // return 0;*/
    // 循环接受指令，发布速度
    ros::Rate loop_rate(50); // 50Hz
    setTurn(0);

#ifdef DEBUG

    std::thread keyboard(getKeyBoardInput);
    keyboard.detach();

#endif
    while (ros::ok())
    {
        if (opened == 0)
        {
            ROS_ERROR("THE CAN IS NOT OPEN!!!");
            continue;
        }

        ros::spinOnce();
        {
            std::unique_lock<std::mutex> lock(CanIO.recv_data_lock);

            g_CurrentGear = getGear();
            g_CurrentSpeed = getSpd() / 3.6; // 当前速度信息 恒为正

            g_Direction = g_TargetGear == 2 ? -1 : 1;

            g_TargetSpeed = std::abs(g_TargetSpeed);

            g_CurrentAcceleration = g_Direction * getAcc(); //倒车刹车时加速度 应为负
            g_CurrentAngle = getTurn();

            g_TurningSystemStatus = getTurnStatus();
            g_LongitudeDrivingStatus = getLongitudeDrivingMode();
            g_HandBrakeStatus = getEPBStatus();
        }

        /* --------------------------- DEBUG 模式下 根据键盘调节车速 --------------------------- */

#ifdef DEBUG

        if (g_KeyBoardInput == 'w')
        {
            g_TargetSpeed += 0.2;
            std::cerr << "Current speed up: " << g_TargetSpeed << std::endl;
            {
                std::lock_guard<std::mutex> lock(g_KeyBoardMutex);
                g_KeyBoardInput = 0;
            }
        }
        else if (g_KeyBoardInput == 's')
        {
            g_TargetSpeed -= 0.2;
            if (g_TargetSpeed < 0)
            {
                g_TargetSpeed = 0;
            }
            std::cerr << "Current speed down: " << g_TargetSpeed << std::endl;
            {
                std::lock_guard<std::mutex> lock(g_KeyBoardMutex);
                g_KeyBoardInput = 0;
            }
        }
        // std::cerr << "Current target speed: " << g_TargetSpeed << std::endl;

#endif
        // 根据期望速度分段pid控制 输出加速度
        g_TargetAcceleration = setTargetAccel(g_TargetSpeed, g_CurrentSpeed, g_LastError, g_AccumulatedError, g_PidVoltage, n);
        // std::cerr << "DIRECTION:" << g_Direction << std::endl;
#ifdef DEBUG
        if (g_Direction == 1)
        {
            g_TargetGear = 3;
        }
        else if (g_Direction == -1 && g_CurrentSpeed < 1)
        {
            g_TargetGear = 1;
        }
        setTurn(0);

#endif
        /* --------------------------------- 进入起步判断 --------------------------------- */
        // 如果当前车速小于0.3 且 期望加速度大于0.04 且 档位P档
        if (std::abs(g_CurrentSpeed) < 0.3 &&
            g_TargetAcceleration > 0.04
            /*&& g_CurrentGear == 2*/
        )
            g_BreakHandBrakeCount++;
        else
            g_BreakHandBrakeCount = 0;

        // 计数器稳定大于40后再执行起步策略
        // 这里限制怠速时不要0.1以上的加速度 但是起步时要求0.4以上的加速度 在下发之前要判断现在是不是起步状态
        if (g_BreakHandBrakeCount < 25)
        {
            // 依据说明书设置正常状态下的标志位
            setDecToStop(0);
            setDriveoffReq(0);
#ifdef FILTER
            lastTargetAccel = g_TargetAcceleration;
            currTargetAccel = filterTimeConstant * g_TargetAcceleration +
                              (1 - filterTimeConstant) * lastTargetAccel;
            g_TargetAcceleration = currTargetAccel;
            lastTargetAccel = currTargetAccel;
#endif
            // 如果期望速度在怠速以下（含0） 对怠速控制的加速度做限制
            // 如果不是怠速以下，不作处理，直接执行期望值
            if (std::abs(g_TargetSpeed) < 1.1)
            {

#ifdef DEBUG

                if (g_Direction == 1)
                {
                    std::cout << "Likecan: acceleration is limited due to lazy speed. " << std::endl;
                    g_TargetAcceleration = std::max(std::min(g_TargetAcceleration, 0.05), -0.8);
                }
                else
                {
                    g_TargetAcceleration = std::max(std::min(g_TargetAcceleration, 0.1), -0.5);
                }

                // 怠速调控 减速时，如果底盘没有进入减速模式，就发较大的减速度刺激
                //! 对于正常的响应延迟？

                // 怠速时候一旦进入加速就发减速度
                if (g_LongitudeDrivingStatus == 2)
                {
                    g_TargetAcceleration = -1;
                }

                if (g_TargetAcceleration < 0 && g_LongitudeDrivingStatus != 3)
                {
                    std::cerr << "Expect vehicle to decelerate but the vehicle is in accelerated mode" << std::endl;
                    g_TargetAcceleration = -1;
                }

#else

                if (g_Direction == 1)
                {
                    std::cout << "Likecan: acceleration is limited due to lazy speed. " << std::endl;
                    g_TargetAcceleration = std::max(std::min(g_TargetAcceleration, 0.05), -0.8);
                }
                else
                {
                    g_TargetAcceleration = std::max(std::min(g_TargetAcceleration, 0.1), -0.5);
                }

                // 怠速调控 减速时，如果底盘没有进入减速模式，就发较大的减速度刺激
                //! 对于正常的响应延迟？

                // 怠速时候一旦进入加速就发减速度
                if (g_LongitudeDrivingStatus == 2)
                {
                    g_TargetAcceleration = -1.0;
                }

                if (g_TargetAcceleration < 0 && g_LongitudeDrivingStatus != 3)
                {
                    // std::cerr << "Expect vehicle to decelerate but the vehicle is in accelerated mode" << std::endl;
                    g_TargetAcceleration = -1.0;
                }

#endif
            }
        }

        //g_BreakHandBrakeCount > 40进入起步状态 直到不满足起步状态条件时计数器清零
        else
        {
            std::cerr << "Start up count: " << g_BreakHandBrakeCount - 25 << std::endl;
            setDecToStop(0);
            setDriveoffReq(1);
            // std::cerr << "------------------------------------------" << std::endl;
            if (g_Direction == 1)
                g_TargetAcceleration = g_HandBrakeStatus != 0 ? 0.7 : 0.3;
            else
                g_TargetAcceleration = g_HandBrakeStatus != 0 ? 0.4 : 0.3;
        }

        if (g_TurningSystemStatus != 1)
        {
            // std::cerr << "turn status:" << g_TurningSystemStatus << std::endl;
            // enterTurn();
            // std::cerr << "turn status:" << g_TurningSystemStatus << std::endl;
        }

        // 从底层读取速度并发布
        geometry_msgs::TwistStamped currentTwistMsg;
        currentTwistMsg.twist.linear.x = g_CurrentSpeed;
        currentTwistMsg.twist.angular.z = g_CurrentAngle;
        currentTwistMsg.header.stamp = ros::Time::now();

        pubSpeedAndAngle.publish(currentTwistMsg);

        // g_TargetAngle = std::max(-400.0, std::min(400.0, g_TargetAngle));
        double angleUpperBound = g_CurrentAngle + 40.0;
        double angleLowerBound = g_CurrentAngle - 40.0;
        g_TargetAngle = g_TargetAngle > angleUpperBound ? angleUpperBound : g_TargetAngle;
        g_TargetAngle = g_TargetAngle < angleLowerBound ? angleLowerBound : g_TargetAngle;
        g_TargetAngle = std::max(-500.0, std::min(500.0, g_TargetAngle));
        setTurn(g_TargetAngle); // 设置加速度方向盘转角 deg
        setGear(g_TargetGear);

        // 对加速度做限制
        std_msgs::Float64 currentAccelerationMsg, targetAccelerationMsg;

        // 如果期望速度为 0，则发送固定加速度保证其刹停；
        if (std::abs(g_TargetSpeed) < 0.1)
        {
            printf("Decrease to stop......\n");
            g_TargetAcceleration = -2.0;
            setDriveoffReq(0);
            setDecToStop(1);
        }
        // 怠速外 加速度做限制 不然这个限制会对怠速时加减速模式切换有影响
        else if (std::abs(g_TargetSpeed) > 1.1)
        {
            g_TargetAcceleration = std::min(g_CurrentAcceleration + 1.2, g_TargetAcceleration);
            g_TargetAcceleration = std::max(g_CurrentAcceleration - 1.2, g_TargetAcceleration);
        }

        // 发布当前加速度
        currentAccelerationMsg.data = g_CurrentAcceleration;
        pubCurrentAcceleration.publish(currentAccelerationMsg);

        // 发布当前期望加速度
        targetAccelerationMsg.data = g_TargetAcceleration;
        pubTargetAcceleration.publish(targetAccelerationMsg);

        // 发布期望速度
        std_msgs::Float64 targetSpeedMsg;
        targetSpeedMsg.data = std::abs(g_TargetSpeed);
        pubTargetSpeed.publish(targetSpeedMsg);

        // 发布底层各种状态
        geometry_msgs::TwistStamped chasisStatusMsg;
        chasisStatusMsg.twist.linear.x = g_LongitudeDrivingStatus;
        chasisStatusMsg.twist.linear.y = g_TurningSystemStatus;

        setAcc(g_TargetAcceleration);
        printf("final tarAccel : %.3f, current Acc : %.3f, final tarSteer : %.3f, current Steer : %.3f\n", g_TargetAcceleration, g_CurrentAcceleration, g_TargetAngle, g_CurrentAngle);

        // 遥控急停控制；
        remote_control_signal = all_can_recv[0x222].all_int_data["Remote_Control_Mode"].data;
        printf("[test]: remote_control_signal is %d\n", remote_control_signal);
        if (remote_control_signal)
        {
            printf("remoter button has been pressed...\nRemote_Control_Mode is %d\n", remote_control_signal);

            // 0x111;
            setAcc(all_can_recv[0x111].all_double_data["ADS_TarAcce"].data);
            setDriveoffReq(all_can_recv[0x111].all_bool_data["ADS_Driveoff_Req"].data);
            setDecToStop(all_can_recv[0x111].all_bool_data["ADS_DecToStop"].data);
            all_can_send[0x111].all_int_data["ADS_Mode"].data = all_can_recv[0x111].all_int_data["ADS_Mode"].data;
            all_can_send[0x111].all_bool_data["ADS_AEB_TgtDecel_Req"].data = all_can_recv[0x111].all_bool_data["ADS_AEB_TgtDecel_Req"].data;
            all_can_send[0x111].all_double_data["ADS_AEB_TarAcce"].data = all_can_recv[0x111].all_double_data["ADS_AEB_TarAcce"].data;

            // 0x115;
            all_can_send[0x115].all_int_data["ADS_ShiftMode"].data = all_can_recv[0x115].all_int_data["ADS_ShiftMode"].data;
            all_can_send[0x115].all_int_data["ADS_TargetGear"].data = all_can_recv[0x115].all_int_data["ADS_TargetGear"].data;
        }

        // 向can发送报文
        send_all_safe(send);
        loop_rate.sleep();
    }

    setDriveoffReq(0);
    setDecToStop(1);
    setAcc(0.0);

    exitTurn();
    exitDrive();
    exitGear();

    send_all_safe(send);
    sleep(2);

    delete[] send->data;

    //sleep(3);
    send->run = false;
    recv->run = false;
    //todo
    //检测各模式的自动驾驶是否退出
    CanIO.join();
    return 0;
}

void CallbackNormalControlCmd(const control_msgs::control_req::ConstPtr controlCmdMsg)
{
    int currentBehaviorState;
    {
        std::lock_guard<std::mutex> lock(g_CurrentBehaviorMutex);
        currentBehaviorState = g_CurrentBehaviorState;
    }
    if (currentBehaviorState == 16) //! parking_state is 16 !!!!!
        return;

    LOG(INFO) << "LikeCAN receives normal pursuit control msgs";
    g_TargetSpeed = controlCmdMsg->Vel_req;
    g_TargetGear = controlCmdMsg->Gear_req;
    g_TargetAngle = 18.06 * controlCmdMsg->Angle_req * 180 / 3.14;
}

void CallbackParkingControlCmd(const control_msgs::control_req::ConstPtr controlCmdMsg)
{
    int currentBehaviorState;
    {
        std::lock_guard<std::mutex> lock(g_CurrentBehaviorMutex);
        currentBehaviorState = g_CurrentBehaviorState;
    }
    if (currentBehaviorState != 16) //! parking_state is 16 !!!!!
        return;

    // LOG(INFO) << "LikeCAN receives dwa parking control msgs";
    g_TargetSpeed = controlCmdMsg->Vel_req;
    g_TargetGear = controlCmdMsg->Gear_req;
    g_TargetAngle = 18.06 * controlCmdMsg->Angle_req;
}

void CallbackCurrentBehavior(const geometry_msgs::TwistStamped::ConstPtr currentBehaviorMsg)
{
    std::lock_guard<std::mutex> lock(g_CurrentBehaviorMutex);
    g_CurrentBehaviorState = currentBehaviorMsg->twist.angular.y;
}
