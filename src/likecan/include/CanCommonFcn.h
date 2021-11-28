#ifndef CANCOMMONFCN_H
#define CANCOMMONFCN_H

#include "CanMsgDefs.h"
#include <ros/ros.h>

// 这里按照说明书定义了一些常用函数， 可以自行添加，
// 注意这些函数只修改了预存的数据，
// 并没有修改发送的数据
namespace CanProcess
{

    void send_by_id(DWORD id, CAN_DataFrame *data)
    {
        if (all_can_send.find(id) != all_can_send.end())
        {
            all_can_send[id].toDataFrame(data);
        }
    }

    void send_all(CAN_DataFrame *data)
    {
        int i = 0;
        for (auto &msg_pair : all_can_send)
        {
            auto &msg = msg_pair.second;
            msg.toDataFrame(data + i);
            i++;
        }
    }

    void send_all_safe(send_args *send)
    {
        if (send)
        {
            std::unique_lock<std::mutex> lock(send->datalock);
            send_all(send->data);
        }
    }

    // 转向类
    /**
     * 进入自动驾驶模式
    */
    void enterTurn()
    {
        all_can_send[0x113].all_int_data["ADS_EPSMode"].data = 2;
    }
    /**
     * 退出自动驾驶模式
    */
    void exitTurn()
    {
        all_can_send[0x113].all_int_data["ADS_EPS_Mode"].data = 0;
    }

    /**
     * 发送控制信号
    */
    void setTurn(double angle)
    {
        all_can_send[0x113].all_double_data["ADS_ReqEPSTargetAngle"].data = angle;
    }

    /**
     * 获取方向盘转角
    */
    double getTurn()
    {
        return -all_can_recv[0x235].all_double_data["SteerWheelAngle"].data * (all_can_recv[0x235].all_bool_data["SteerWheelAngleSign"].data * 2 - 1);
    }

    /**
     * 获取状态
    */
    int getTurnStatus()
    {
        return all_can_recv[0x237].all_int_data["EPS_StreeingMode"].data;
    }

    // 驱动类
    /**
     * 进入
    */
    void enterDrive()
    {
        all_can_send[0x111].all_int_data["ADS_Mode"].data = 3;
    }

    void exitDrive()
    {
        all_can_send[0x111].all_int_data["ADS_Mode"].data = 0;
    }

    void setAcc(double data)
    {
        all_can_send[0x111].all_double_data["ADS_TarAcce"].data = data;
        // if (data < 0)
        // {
        //     all_can_send[0x111].all_bool_data["ADS_Driveoff_Req"].data = 0;
        // }
        // else
        // {
        //     all_can_send[0x111].all_bool_data["ADS_Driveoff_Req"].data = 0;
        // }
    }

    void setDriveoffReq(bool data)
    {
        all_can_send[0x111].all_bool_data["ADS_Driveoff_Req"].data = data;
    }

    void setDecToStop(bool data)
    {
        all_can_send[0x111].all_bool_data["ADS_DecToStop"].data = data;
    }

    double getAcc()
    {
        return all_can_recv[0x243].all_double_data["LongitudeAcce"].data;
    }

    double getSpd()
    {
        return all_can_recv[0x240].all_double_data["VehicleSpd"].data;
    }

    int getLongitudeDrivingMode()
    {
        return all_can_recv[0x310].all_int_data["LongitudeDrivingMode"].data;
    }

    int getEPBStatus()
    {
        return all_can_recv[0x310].all_int_data["EPBSts"].data;
    }

    void AEBStop()
    {
        all_can_send[0x111].all_bool_data["ADS_AEB_TgtDecel_Req"].data = 1;
        all_can_send[0x111].all_double_data["ADS_AEB_TarAcce"].data = 2;
    }

    // 换挡类

    void enterGear()
    {
        all_can_send[0x115].all_int_data["ADS_ShiftMode"].data = 1;
    }

    void exitGear()
    {
        all_can_send[0x115].all_int_data["ADS_ShiftMode"].data = 0;
    }

    void setGear(int tarGear)
    {
        all_can_send[0x115].all_int_data["ADS_TargetGear"].data = tarGear;
        // std::cerr << "target gear :" << tarGear << std::endl;
    }

    double getGear()
    {
        return all_can_recv[0x237].all_int_data["CurrentGear"].data;
    }

    // 车身类

    void enterBCM()
    {
        all_can_send[0x38E].all_int_data["ADS_BCM_WorkSts"].data = 2;
        all_can_send[0x38E].all_bool_data["ADS_BCMWorkStsValid"].data = 1;
        all_can_send[0x38E].all_bool_data["ADS_ReqControlBCM"].data = 1;
    }

    void exitBCM()
    {
        all_can_send[0x38E].all_bool_data["ADS_ReqControlBCM"].data = 0;
    }

    void exitAll()
    {
        exitDrive();
        exitTurn();
        exitGear();
        exitBCM();
    }

    /*输入速度，输出加速度 PID控制*/
    double setTargetAccel(double target, double current, double &errLast, double &errAccumulated, double &voltage, ros::NodeHandle &nh)
    {
        double accel;
        double err = std::abs(target) - current;
        double Kp, Ki, Kd;
        double kp1, kp2, kp3, ki1, ki2, ki3, kd1, kd2, kd3;
        double total_velocity;
        nh.param("likecan/kp1", kp1, 0.6);
        nh.param("likecan/ki1", ki1, 0.0);
        nh.param("likecan/kd1", kd1, 0.1);
        nh.param("likecan/kp2", kp2, 0.2);
        nh.param("likecan/ki2", ki2, 0.0);
        nh.param("likecan/kd2", kd2, 0.0);
        nh.param("likecan/kp3", kp3, 3.0);
        nh.param("likecan/ki3", ki3, 0.0);
        nh.param("likecan/kd3", kd3, 0.3);

        // std::cerr << "kp2: " << kp2
        //           << "\tki2: " << ki2
        //           << "\tkd2: " << kd2 << std::endl;
        // 还没考虑后退时大于怠速的情况；
        // 考虑停车
        // std::cerr << "Current target speed in pid: " << target << std::endl;
        if (abs(target) < 0.1)
        {
            // std::cout << "-0.1 < target < 0.1" << std::endl;
            return -2.0;
        }
        else if (abs(target) > 1.1)
        {
            Kp = kp1;
            Ki = ki1;
            Kd = kd1; //定义比例、积分、微分系数

            // std::cout << "target > 1.1 || target < -1.1" << std::endl;
        }
        else if (target > 0.1) // 低于怠速且前进时；
        {
            Kp = kp2;
            Ki = ki2;
            Kd = kd2; //定义比例、积分、微分系数

            // std::cout << "0.1 < target < 1.1" << std::endl;
        }
        else if (target < -0.1)
        {
            Kp = kp3;
            Ki = ki3;
            Kd = kd3;

            // std::cout << "-1.1 < target < -0.1" << std::endl;
        }
        
        voltage = Kp * err + Ki * errAccumulated + Kd * (err - errLast);

        // if (abs(target) > 1.1)
        // {
        //     increment = std::min(0.5, increment);
        //     increment = std::max(-0.5, increment);
        // }

        
        total_velocity = voltage;

        // std::cerr << "kp: " << Kp
        //           << "\tki: " << Ki
        //           << "\tkd: " << Kd
        //           << "\ntarget  speed: " << target
        //           << "\ncurrent speed: " << current
        //           << "\ntarget    acc: " << total_velocity
        //           << std::endl;
        // std::cerr << "\e[31m"
        //           << "the first output acc = " << total_velocity << "\e[31m" << std::endl;

        if (total_velocity < -6.5)
        {
            accel = -6.5;
        }
        else if (total_velocity > 2.6)
        {
            accel = 2.6;
        }
        else
        {
            accel = total_velocity;
        }
        setAcc(accel);
        errLast = err;
        errAccumulated += err;
        return accel;
    }

    /*PID控制*/
    void setRealAccel(double target, double current, double &errLast, double &err_last_last, double &voltage, ros::NodeHandle &nh)
    {
        double kp4, ki4, kd4;
        //后退
        // nh.param("kp4", kp4, 0.5);
        // nh.param("ki4", ki4, 0.0);
        // nh.param("kd4", kd4, 0.1);

        //前进
        nh.param("kp4", kp4, 2.0);
        nh.param("ki4", ki4, 0.0);
        nh.param("kd4", kd4, 0.1);

        // std::cerr << "\e[31m"<<"kp4 = " << kp4 <<"\e[31m"<< std::endl;
        // std::cerr << "\e[31m"<<"kd4 = " << kd4 <<"\e[31m"<< std::endl;
        double Kp = kp4;
        double Ki = ki4;
        double Kd = kd4; //定义比例、积分、微分系数
        double err = target - current;
        double increment = Kp * (err - errLast) + Ki * err + Kd * (err - 2 * errLast + err_last_last);
        double total_accel;
        //printf("increment: %lf", increment);
        if (increment > 0.3)
        {
            increment = 0.3;
        }
        // std::cerr << "\e[31m"<<"increment = " << increment <<"\e[31m"<< std::endl;
        // std::cerr << "\e[31m"<<"voltage = " << voltage <<"\e[31m"<< std::endl;
        // else if(increment < -0.5)
        // {
        //     increment = -0.5;
        // }
        voltage += increment;
        // total_accel = voltage + current;
        //不用加速度pid
        total_accel = target;

        if (total_accel < -6.5)
        {
            setAcc(-6.5);
            // std::cerr << "\e[31m"<<"the output accelaration = " << -6.5 <<"\e[31m"<< std::endl;
        }
        else if (total_accel > 2.6)
        {
            setAcc(2.6);
            // std::cerr << "\e[31m"<<"the output accelaration = " << 5 <<"\e[31m"<< std::endl;
        }
        else
        {
            setAcc(total_accel);
            // std::cerr << "\e[31m"<<"the output accelaration = " << total_accel <<"\e[31m"<< std::endl;
        }

        errLast = err;
        err_last_last = errLast;
    }

}
#endif
