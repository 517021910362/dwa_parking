#include "dwa_planner.h"

//-------------------------------------------------------------
DwaPlanner::DwaPlanner(ros::NodeHandle &node_handle, string &frame_id, bool reverse, bool simulation)
{
    msFrame_id = frame_id;
    nh = node_handle;
    name_of_node = ros::this_node::getName();

    nh.param("PI", PI, 3.1415926f);
    nh.param("MAX_SPEED", MAX_SPEED, 5.0f);
    nh.param("MIN_SPEED", MIN_SPEED, -5.0f);
    nh.param("MAX_ACC", MAX_ACC, 3.5f);
    nh.param("MIN_ACC", MIN_ACC, -3.5f);
    nh.param("MAX_STEER", MAX_STEER, 30 * PI / 180); //25 * PI / 180
    nh.param("MIN_STEER", MIN_STEER, -30 * PI / 180);
    nh.param("MAX_STEER_SPEED", MAX_STEER_SPEED, 20 * PI / 180); //20 * PI / 180
    nh.param("MIN_STEER_SPEED", MIN_STEER_SPEED, -20 * PI / 180);
    nh.param("MAX_STEER_ACC", MAX_STEER_ACC, 100 * PI / 180);
    nh.param("MIN_STEER_ACC", MIN_STEER_ACC, -100 * PI / 180);
    nh.param("SPEED_RESOLUTION", SPEED_RESOLUTION, 1.0f);
    nh.param("STEER_RESOLUTION", STEER_RESOLUTION, 5 * PI / 180);
    nh.param("dt", dt, 0.1f);
    nh.param("PREDICT_TIME", PREDICT_TIME, 3.0f); //launch里指定用yaml里的值，未定义才是这里的值
    nh.param("VEHICLE_H", VEHICLE_H, 1.860f);
    nh.param("DWA_VEHICLE_H", DWA_VEHICLE_H, 2.6f);
    nh.param("VEHICLE_V_AXIS", VEHICLE_V_AXIS, 2.68f);
    nh.param("VEHICLE_V_FRONT", VEHICLE_V_FRONT, 2.5f);
    nh.param("VEHICLE_V_BACK", VEHICLE_V_BACK, 1.5f);
    nh.param("mfDirectionWeight", mfDirectionWeight, 0.5f);
    nh.param("mfOscillationWeight", mfOscillationWeight, 0.0f);
    nh.param("mfDistanceWeight", mfDistanceWeight, 0.5f);
    nh.param("mfHeadingWeight", mfHeadingWeight, 0.0f);
    cout << "PARAMETERS LOADED" << endl;

    best_path_pub = nh.advertise<nav_msgs::Path>(name_of_node + "/best_trajectory", 1, true);
    best_polygon_pub = nh.advertise<geometry_msgs::PolygonStamped>(name_of_node + "/best_polygon", 1, true);
    bound_box_pub = nh.advertise<geometry_msgs::PolygonStamped>(name_of_node + "/bound_box", 1, true);
    path_pub = nh.advertise<nav_msgs::Path>(name_of_node + "/all_trajectory", 1, true);
    collision_map_pub = nh.advertise<nav_msgs::OccupancyGrid>(name_of_node + "/collision_map", 1, true);
    control_cmd_pub = nh.advertise<control_msgs::control_req>("/parking_control_req", 1, true);
    traj_pub = nh.advertise<visualization_msgs::MarkerArray>("/all_traj", 1, true);
    sim_pose_pub = nh.advertise<geometry_msgs::PoseStamped>("/dwa_sim_pose", 1, true);
    current_target_point_pub = nh.advertise<geometry_msgs::PointStamped>(name_of_node + "/current_target_point", 1, true);
    current_target_heading_pub = nh.advertise<geometry_msgs::PointStamped>(name_of_node + "/current_target_heading", 1, true);
    restart_drive_pub = nh.advertise<std_msgs::Int8>("/restart_drive", 1, true);

    map_sub = nh.subscribe("/occupancy_grid_map", 10, &DwaPlanner::getMap, this);    //接受实时的局部栅格地图
    target_sub = nh.subscribe("/dwa_target_point", 1, &DwaPlanner::getTarget, this); //接受局部目标点坐标
    predict_time_sub = nh.subscribe("/dwa_predict_time", 1, &DwaPlanner::resetTime, this);
    target_heading_sub = nh.subscribe("/dwa_target_heading", 1, &DwaPlanner::getHeading, this); //接受局部目标点朝向
    turning_flag_sub = nh.subscribe("/dwa_direction", 1, &DwaPlanner::getTurningFlag, this);
    dwa_state_sub = nh.subscribe("/dwa_state", 1, &DwaPlanner::getState, this); // 接收状态；
    lot_type_sub = nh.subscribe("/dwa_lot_type", 1, &DwaPlanner::getLotType, this);

    msInitState.fx = 0;
    msInitState.fy = 0;
    msInitState.fyaw = 1.57;
    mtLastTrajectory.fspeed = 0;
    mtLastTrajectory.fsteer = 0;
    mtLastTrajectory.fTotalCost = 0;

    mtBestTrajectory.fspeed = 0;
    mtBestTrajectory.fsteer = 0;
    mtBestTrajectory.fTotalCost = 0;

    mfCurSpeed = 0;
    mfCurSteer = 0;

    mpTarget.fx = 0;
    mpTarget.fy = 0;

    mpTargetHeading.fx = 0;
    mpTargetHeading.fy = 0;

    mnTargetDirection = 1;
    mnLastTargetDirection = 1;

    mbReverse = reverse;
    mbSimulation = 0;

    dwa_state = 0;
    dwa_stop_flag = 0;

    PREDICT_TIME = 5.0;

    for (int i = 0; i < 500; i++)
    {
        control_msgs::control_req control_req;

        control_req.Vel_req = 0;
        control_req.Angle_req = 0;
        control_req.Gear_req = 2;
        control_cmd_pub.publish(control_req);
    }
}

DwaPlanner::~DwaPlanner()
{
    for (int i = 0; i < 500; i++)
    {
        control_msgs::control_req control_req;

        control_req.Vel_req = 0;
        control_req.Angle_req = 0;
        control_req.Gear_req = 2;
        control_cmd_pub.publish(control_req);
    }
}

void DwaPlanner::StartLocalPlanner()
{
    if (map_ == NULL)
        return;

    //已到达终点或需要重新规划
    if (std::abs(mpTarget.fx - 0.0) <= 1e-3 && std::abs(mpTarget.fy - 0.0) <= 1e-3)
        return;

    refreshSampleRange(mtLastTrajectory.fspeed, mtLastTrajectory.fsteer);
    float fSampleSpeed = mfSampleSpeedMin;
    float fSampleSteer = mfSampleSteerMin;

    float fTotalDirectionCost = 0;
    float fTotalOscillationCost = 0;
    float fTotalDistanceCost = 0;
    float fTotalHeadingCost = 0;

    // ROS_INFO("predict time = %f", PREDICT_TIME);

    // ROS_INFO("DWA LINE 124");
    //for (fSampleSteer = mfSampleSteerMin; fSampleSteer <= mfSampleSteerMax; fSampleSteer += STEER_RESOLUTION)
    // for (fSampleSteer = -21.5 * PI / 180; fSampleSteer <= 21.5 * PI / 180; fSampleSteer += 43 * PI / 180 / 40) //保持匀速，采样转角

    for (fSampleSteer = -27 * PI / 180; fSampleSteer <= 27 * PI / 180; fSampleSteer += 44 * PI / 180 / 40) //保持匀速，采样转角
    {
        if (abs(fSampleSpeed) < 1e-5)
            continue;
        trajectory trial;
        //trial.fspeed = fSampleSpeed;
        // 倒车
        if (mnTargetDirection > 0)
        {
            trial.fspeed = 0.6f; //2.822222f
        }
        else if (mnTargetDirection < 0)
        {
            trial.fspeed = -0.6f;
        }
        else if (mnTargetDirection == 0)
        {
            trial.fspeed = 0.0f;
        }
        trial.fsteer = fSampleSteer;
        //计算轨迹中的各个位置的姿态
        getStatesInTraj(trial);
        //首先检测能不能撞到障碍物 如果撞到了直接跳过
        //ROS_INFO("Start Collision Check ...");
        trial.bCollisionFlag = false;
        if (mnTargetDirection > 0)
        {
            CollisionCheck(trial);
        }
        else
        {
            // trial.bCollisionFlag = 0;
            // CollisionCheck(trial);
        }
        if (trial.bCollisionFlag)
        {
            // ROS_INFO("Collision!");
            //放弃这条轨迹
            continue;
        }

        if (dwa_state == 0)
        {
            if (abs(trial.fsteer) > 10 * PI / 180) // 限制第一阶段转角范围；
            {
                continue;
            }
            else if (abs(trial.fsteer - mtLastTrajectory.fsteer) > 3 * PI / 180) // 限制第一阶段的转角速度；
            {
                continue;
            }
        }

        getDirectionCost(trial);
        getOscillationCost(trial);
        getDistanceCost(trial);
        getHeadingCost(trial);

        //轨迹分段，调用多次dwa
        mvtTrials.push_back(trial);
        fTotalDirectionCost += trial.fDirectionCost;
        fTotalOscillationCost += trial.fOscillationCost;
        fTotalDistanceCost += trial.fDistanceCost;
        fTotalHeadingCost += trial.fHeadingCost;

        pubTrajAsPath(trial);
    }
    if (!mvtTrials.size())
    {
        ROS_INFO("All trials will collide!");

        // ROS_INFO("All trials will collide!");
        control_msgs::control_req control_req;

        control_req.Vel_req = 0;
        control_req.Angle_req = 0;
        control_req.Gear_req = 2;
        control_cmd_pub.publish(control_req);
        return;
    }

    float fMinCost = 100000;
    fMaxCost = 0;
    float w1 = 15.0; //5.0;  //distance,dwa路径末端到关键点朝向直线的距离.容易导致在直线两侧来回偏
    float w2 = 7.0;  //19.0; // direction, 20.0 dwa路径末端朝向  与  当前点与关键点连线  夹角
    float w3 = 8.0;  //8.0;  // heading 8.0  ,dwa路径终点朝向   与   关键点朝向  夹角     防止当前朝向与关键点朝向相同时保持直线行驶,仿真时设为0最好，实际可不为0

    double distFuzzy = std::abs(-mpTarget.fx * (mpTargetHeading.fy - mpTarget.fy) + mpTarget.fy * (mpTargetHeading.fx - mpTarget.fx)) / std::sqrt((mpTargetHeading.fy - mpTarget.fy) * (mpTargetHeading.fy - mpTarget.fy) + (mpTargetHeading.fx - mpTarget.fx) * (mpTargetHeading.fx - mpTarget.fx));
    double angleFuzzy = fTotalHeadingCost / mvtTrials.size();
    // 模糊控制，在距离较大时增加距离权重
    w1 = 3.0 * WeightChange(distFuzzy, angleFuzzy); // 较稳定版0.8   v1_5.0；
    // std::cout << "lot state: " << lot_type << std::endl;
    //  根据不同状态选择参数；
    if (lot_type == 0)
    {
        std::cout << "dwa state: " << dwa_state << std::endl;
        switch (dwa_state)
        {
        case 0:
            w1 = 0;
            w3 = 0;
            break;
        case 1:
            w2 = 19.0;
            // w3 = 0.0;
            break;
        case 2: // w1=1000 w2,w3 dont change
            w1 = 10.0;
            w2 = 20;
            // w3 = 0.0;
            break;
        case 3:
            w1 = 0;
            w3 = 0;
            break;
        case 4:
            break;
        default:
            break;
        }
    }
    else
    {
        switch (dwa_state)
        {
        case 0:
            w3 = 0;
            break;
        case 1:
            // w1 = w1 * 10 / 3;
            w1 = 0.0;
            w2 = 10.0;
            w3 = 8.0;
            // w3 = 5.0;
            break;
        case 2: // w1=1000 w2,w3 dont change
            w1 = 0;
            w2 = 8;
            w3 = 50;
            break;
        case 3:
            w1 = 0.0;
            w2 = 20;
            // w3 = 8;
            break;
        case 4:
            break;
        default:
            break;
        }
    }
    // std::cout << "w1,w2,w3,state = " << w1 << "  " << w2 << "  " << w3 << "  " << dwa_state << std::endl;

    for (vector<trajectory>::iterator tit = mvtTrials.begin(); tit != mvtTrials.end(); tit++)
    {
        float fNormDirectionCost = tit->fDirectionCost / fTotalDirectionCost;
        float fNormOscillationCost = tit->fOscillationCost / fTotalOscillationCost;
        float fNormDistanceCost = tit->fDistanceCost / fTotalDistanceCost;
        float fNormHeadingCost = tit->fHeadingCost / fTotalHeadingCost;
        // std::cout << "cost and steer= " << fNormDirectionCost << "  " << fNormDistanceCost << "  " << fNormHeadingCost << " " << tit->fsteer / M_PI * 180 << std::endl;
        tit->fTotalCost = w2 * fNormDirectionCost + w1 * fNormDistanceCost + w3 * fNormHeadingCost; // 0 -> 2.0+ //w3 * fNormHeadingCost

        if (tit->fTotalCost < fMinCost)
        {
            fMinCost = tit->fTotalCost;
            mtBestTrajectory = *tit;
        }
        if (tit->fTotalCost > fMaxCost)
        {
            fMaxCost = tit->fTotalCost;
        }
    }

    // std::cout << "Best-steer: " << mtBestTrajectory.fsteer / M_PI * 180 << std::endl;
    // pubVisTraj();
    pubBestTrajAsPath();
    mtLastTrajectory = mtBestTrajectory;
    if (mnTargetDirection == -1 && mnLastTargetDirection == 1)
        prepareForBackward();
    else if (lot_type == 1 && dwa_state == 2 && dwa_stop_flag == 0)
    {
        brake();
        dwa_stop_flag = 1;
    }
    else
    {
        pubControlCmd();
    }
    mnLastTargetDirection = mnTargetDirection;
    pubBestTrajCollisionMap();
    // pubSimPosition(0.1);

    // if (mbSimulation)
    // {
    //     pubSimPosition(0.5);
    // }

    mvtTrials.clear();
}

//激光点云生成的局部地图，用于dwa避障
void DwaPlanner::getMap(const nav_msgs::OccupancyGridConstPtr &map)
{
    // dwa的地图坐标系与车辆固结，设置为前y右x， 但发过来的所有量都是前x左y
    map_ = map;
    mfResolution = map_->info.resolution;
    mfWidth = map_->info.height;
    mfHeight = map_->info.width;
    mpOrigin.fx = -map_->info.origin.position.y;
    mpOrigin.fy = map_->info.origin.position.x;
}

//关键点坐标
void DwaPlanner::getTarget(const geometry_msgs::PointStamped &target)
{
    // dwa的地图坐标系与车辆固结，设置为前y右x， 但发过来的所有量都是前x左y
    mpTarget.fx = -target.point.y;
    mpTarget.fy = target.point.x;
    // mnTargetDirection = 1;

    geometry_msgs::PointStamped p;
    p.header.stamp = ros::Time::now();
    p.header.frame_id = msFrame_id;
    p.point.x = mpTarget.fx;
    p.point.y = mpTarget.fy;
    current_target_point_pub.publish(p);
    //cout << "target point: " << mpTarget.fx << ", " << mpTarget.fy << endl;
}

//关键点朝向单位向量
void DwaPlanner::getHeading(const geometry_msgs::PointStamped &heading)
{
    // dwa的地图坐标系与车辆固结，设置为前y右x， 但发过来的所有量都是前x左y
    mpTargetHeading.fx = -heading.point.y;
    mpTargetHeading.fy = heading.point.x;
    mpTar_Head_vec.fx = heading.point.x - mpTarget.fx;
    mpTar_Head_vec.fy = heading.point.y - mpTarget.fy;

    geometry_msgs::PointStamped p;
    p.header.stamp = ros::Time::now();
    p.header.frame_id = msFrame_id;
    p.point.x = mpTargetHeading.fx;
    p.point.y = mpTargetHeading.fy;
    current_target_heading_pub.publish(p);
    // cout<<"target heading: "<<mpTargetHeading.fx<<", "<<mpTargetHeading.fy<<endl;
}

void DwaPlanner::getTurningFlag(const std_msgs::Int8 &dir)
{
    mnTargetDirection = dir.data;
    printf("current state is %d, current direction is %d\n", dwa_state, mnTargetDirection);
}

void DwaPlanner::getState(const std_msgs::Int8 &data)
{
    if (dwa_state != data.data)
        printf("------------------------------- current state is %d ------------------------------- ", data.data);
    dwa_state = data.data;
}

void DwaPlanner::getLotType(const std_msgs::Int8 &data)
{
    lot_type = data.data;
}

void DwaPlanner::resetTime(const std_msgs::Float32 &time)
{
    PREDICT_TIME = time.data;
    // if (turningFlag)
    //     distThresh = 7.5;
    // else
    distThresh = 3.75 * (1 + PREDICT_TIME / 3.5);
    // cout << "PREDICT_TIME: " << PREDICT_TIME << endl;
    // front_dis = ;
    // back_dis = ;
}

void DwaPlanner::getStatesInTraj(trajectory &tTrial)
{
    state sCurState = msInitState;

    float speed = 1.5 * tTrial.fspeed; //实际速度较大，乘一个系数
    float steer = tTrial.fsteer;

    float fTime = 0;
    float fRadius = 0;
    float fYaw0 = 1.57; //PI / 2;
    float fTheta = 0;   //运动模型中转过的圆心角

    tTrial.vsStates.push_back(sCurState);
    if (steer == 0)
        fRadius = INT32_MAX;
    else if (steer > 0)
    {
        fRadius = VEHICLE_V_AXIS / sin(steer) + VEHICLE_H / 2; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
    else
    {
        fRadius = VEHICLE_V_AXIS / sin(steer) - VEHICLE_H / 2;
    }

    while (fTime <= PREDICT_TIME)
    {
        fTheta = speed * fTime / fRadius;
        // sCurState.fyaw = -fTime * speed * tan(steer) / VEHICLE_V_AXIS + fYaw0;
        sCurState.fyaw = -fTheta + fYaw0;
        sCurState.fx = fRadius - fRadius * cos(fTheta);
        sCurState.fy = fRadius * sin(fTheta);

        tTrial.vsStates.push_back(sCurState);
        fTime += dt;
    }
}

void DwaPlanner::refreshSampleRange(float fCurSpeed, float fCurSteer)
{
    mfCurSpeed = fCurSpeed;
    mfCurSteer = fCurSteer;

    mfSampleSpeedMax = std::min<float>(mfCurSpeed + MAX_ACC * PREDICT_TIME, MAX_SPEED);
    mfSampleSpeedMin = std::max<float>(mfCurSpeed - MAX_ACC * PREDICT_TIME, MIN_SPEED);
    mfSampleSteerMax = std::min<float>(mfCurSteer + MAX_STEER_SPEED, MAX_STEER);
    mfSampleSteerMin = std::min<float>(mfCurSteer - MAX_STEER_SPEED, MIN_STEER);
}

void DwaPlanner::prepareForBackward()
{
    float steer = -mtLastTrajectory.fsteer / PI * 180;
    steer = min(max(steer, -25.0f), 25.0f);

    //10Hz频率发送1秒钟等车停下
    //档位置3 速度置0
    for (int i = 1; i < 40; i++)
    {
        control_msgs::control_req control_cmd_msg;
        control_cmd_msg.Angle_req = steer;
        control_cmd_msg.Gear_req = 3;
        control_cmd_msg.Vel_req = 0.0;
        control_cmd_pub.publish(control_cmd_msg);
        ROS_INFO("Prepare for backward: waiting for stop");
        ros::Duration(0.1).sleep();
    }
    for (int i = 1; i < 20; i++)
    {
        control_msgs::control_req control_cmd_msg;
        control_cmd_msg.Angle_req = steer;
        control_cmd_msg.Gear_req = 2;
        control_cmd_msg.Vel_req = 0.0;
        control_cmd_pub.publish(control_cmd_msg);
        ROS_INFO("Prepare for backward: gear N");
        ros::Duration(0.1).sleep();
    }
    std_msgs::Int8 driveflag;
    driveflag.data = 1;
}

void DwaPlanner::brake()
{
    float steer = -mtLastTrajectory.fsteer / PI * 180;
    steer = min(max(steer, -25.0f), 25.0f);

    //10Hz频率发送1秒钟等车停下
    //档位置3 速度置0
    for (int i = 1; i < 50; i++)
    {
        control_msgs::control_req control_cmd_msg;
        control_cmd_msg.Angle_req = steer;
        control_cmd_msg.Gear_req = 1;
        control_cmd_msg.Vel_req = 0.0;
        control_cmd_pub.publish(control_cmd_msg);
        ROS_INFO("Prepare for backward: waiting for stop");
        ros::Duration(0.1).sleep();
    }
    std_msgs::Int8 driveflag;
    driveflag.data = 1;
}

void DwaPlanner::CollisionCheck(trajectory &tTrial)
{
    int size = tTrial.vsStates.size();
    int upBound, lowBound, leftBound, rightBound;
    vector<state>::iterator iterState = tTrial.vsStates.begin();
    tTrial.bCollisionFlag = 0;

    for (; iterState != tTrial.vsStates.end(); iterState++)
    {
        // A 右上 B左上 C右下 D左下

        position fA, fB, fC, fD; //分别代表此时车的四个角点所在的离散坐标
        map_point A, B, C, D;    // 分别代表此时车的四个角点所在的栅格坐标int
        float x, y, yaw, sinyaw, cosyaw;

        x = (*iterState).fx;
        y = (*iterState).fy;
        yaw = (*iterState).fyaw;
        sinyaw = sin(yaw);
        cosyaw = cos(yaw);

        fA.fx = x + DWA_VEHICLE_H / 2 * sinyaw + VEHICLE_V_FRONT * cosyaw;
        fA.fy = y - DWA_VEHICLE_H / 2 * cosyaw + VEHICLE_V_FRONT * sinyaw;
        fB.fx = x - DWA_VEHICLE_H / 2 * sinyaw + VEHICLE_V_FRONT * cosyaw;
        fB.fy = y + DWA_VEHICLE_H / 2 * cosyaw + VEHICLE_V_FRONT * sinyaw;
        fC.fx = x + DWA_VEHICLE_H / 2 * sinyaw - VEHICLE_V_BACK * cosyaw;
        fC.fy = y - DWA_VEHICLE_H / 2 * cosyaw - VEHICLE_V_BACK * sinyaw;
        fD.fx = x - DWA_VEHICLE_H / 2 * sinyaw - VEHICLE_V_BACK * cosyaw;
        fD.fy = y + DWA_VEHICLE_H / 2 * cosyaw - VEHICLE_V_BACK * sinyaw;

        A.nx = int((fA.fx - mpOrigin.fx) / mfResolution);
        A.ny = int((fA.fy - mpOrigin.fy) / mfResolution);
        B.nx = int((fB.fx - mpOrigin.fx) / mfResolution);
        B.ny = int((fB.fy - mpOrigin.fy) / mfResolution);
        C.nx = int((fC.fx - mpOrigin.fx) / mfResolution);
        C.ny = int((fC.fy - mpOrigin.fy) / mfResolution);
        D.nx = int((fD.fx - mpOrigin.fx) / mfResolution);
        D.ny = int((fD.fy - mpOrigin.fy) / mfResolution);

        //upBound = max(max(max(A.ny, B.ny), C.ny), D.ny); //手动递归 会不会影响效率？
        // 初始化 不能把他们初始化为0 会影响排序
        upBound = A.ny;
        lowBound = A.ny;
        leftBound = A.nx;
        rightBound = A.nx;
        int xs[4] = {A.nx, B.nx, C.nx, D.nx};
        int ys[4] = {A.ny, B.ny, C.ny, D.ny};
        //确定四个边界
        for (int i = 0; i < 4; i++)
        {
            upBound = ys[i] > upBound ? ys[i] : upBound;
            lowBound = ys[i] < lowBound ? ys[i] : lowBound;
            leftBound = xs[i] < leftBound ? xs[i] : leftBound;
            rightBound = xs[i] > rightBound ? xs[i] : rightBound;
        }

        if (yaw == 0)
        {
            for (int i = leftBound; i < rightBound; i += 1)
                for (int j = lowBound; j < upBound; j += 1)
                {
                    if (getMapData(i, j) > 0)
                    {
                        tTrial.bCollisionFlag = 1;
                        return;
                    }
                }
        }

        else
        {
            //计算直线参数
            float kAC = (fA.fy - fC.fy) / (fA.fx - fC.fx);
            float kBD = (fB.fy - fD.fy) / (fB.fx - fD.fx);
            float kAB = (fA.fy - fB.fy) / (fA.fx - fB.fx);
            float kCD = (fC.fy - fD.fy) / (fC.fx - fD.fx);

            float bAC = fA.fy - kAC * fA.fx;
            float bBD = fB.fy - kBD * fB.fx;
            float bAB = fA.fy - kAB * fA.fx;
            float bCD = fC.fy - kCD * fC.fx;

            int nbAC = int((bAC - mpOrigin.fy) / mfResolution);
            int nbBD = int((bBD - mpOrigin.fy) / mfResolution);
            int nbAB = int((bAB - mpOrigin.fy) / mfResolution);
            int nbCD = int((bCD - mpOrigin.fy) / mfResolution);

            for (int i = leftBound; i < rightBound; i += 1)
                for (int j = lowBound; j < upBound; j += 1)
                {
                    //分开为了减少一行的量

                    float b1 = (j * mfResolution + mpOrigin.fy) - kAC * (i * mfResolution + mpOrigin.fx);
                    float b2 = (j * mfResolution + mpOrigin.fy) - kAB * (i * mfResolution + mpOrigin.fx);
                    bool isIn_1 = (b1 >= min(bAC, bBD) && b1 <= max(bAC, bBD));
                    bool isIn_2 = (b2 >= min(bAB, bCD) && b2 <= max(bAB, bCD));
                    //cout<<b1<<'\t'<<b2<<'\t'<<bAC<<'\t'<<bBD<<'\t'<<bAB<<'\t'<<bCD<<endl;
                    if (isIn_1 && isIn_2 && getMapData(i, j) > 0) //遍历边框内部与地图占据情况，看是否碰撞
                    {
                        tTrial.bCollisionFlag = 1;
                        return;
                    }
                }
        }
    }
    return;
}

// 判断预测轨迹终点两侧障碍物与车辆纵轴的最短距离是否超过阈值；
bool DwaPlanner::DistCheck(trajectory &tTrial)
{
    float fFinalX = tTrial.vsStates.back().fx;
    float fFinalY = tTrial.vsStates.back().fy;
    float fFinalYaw = tTrial.vsStates.back().fyaw;
    float minDistance = 100, x1, y1, distance;
    float A = tan(fFinalYaw);
    float B = -1;
    float C = fFinalY - A * fFinalX;
    float a = -1 / A;
    float b1 = frontDist / sin(fFinalYaw) + fFinalY + fFinalX / A;
    float b2 = backDist / sin(fFinalYaw) + fFinalY + fFinalX / A;
    // ROS_INFO("fFinalYaw = %.2f, a = %.2f, b1 = %.2f, b2 = %.2f", fFinalYaw, a, b1, b2);

    for (int i = 0; i < map_->data.size(); i++)
    {
        y1 = (i / map_->info.width + 1) * mfResolution + mpOrigin.fy;
        x1 = (i % map_->info.width + 1) * mfResolution + mpOrigin.fx;
        if (((y1 - a * x1) >= b2) && ((y1 - a * x1) <= b1) && map_->data[i] >= 75)
        {
            distance = abs(A * x1 + B * y1 + C) / sqrt(pow(A, 2) + pow(B, 2)); // 障碍物点到轨迹末端朝向直线的距离；
            // ROS_ERROR("distance is %.2f", distance);
            if (distance < minDistance)
            {
                minDistance = distance;
            }
        }
    }

    return minDistance > 2; // 6;distThresh
}

//dwa路径末端朝向  与  当前点与关键点连线  夹角
void DwaPlanner::getDirectionCost(trajectory &tTrial)
{
    //使用向量内积计算
    float fFinalYaw = tTrial.vsStates.back().fyaw;
    // Yaw向量 单位向量
    float fCosYaw = cos(fFinalYaw);
    float fSinYaw = sin(fFinalYaw);
    // Direction向量 单位向量
    float fTargetDirectionNorm = sqrt(mpTarget.fy * mpTarget.fy + mpTarget.fx * mpTarget.fx);
    float fCosTargetDirection = mpTarget.fx / fTargetDirectionNorm;
    float fSinTargetDirection = mpTarget.fy / fTargetDirectionNorm;
    //利用内积求夹角
    float fCosTargetDirectionAndYaw = fCosYaw * fCosTargetDirection + fSinYaw * fSinTargetDirection;
    if (tTrial.fspeed > 0)
    {
        tTrial.fDirectionCost = acos(fCosTargetDirectionAndYaw);
    }
    else
    {
        //倒车时需要用Pi减一下
        tTrial.fDirectionCost = 3.14159 - acos(fCosTargetDirectionAndYaw);
    }
}

void DwaPlanner::getOscillationCost(trajectory &tTrial)
{
    float fSpeedCost = abs(tTrial.fspeed - mtLastTrajectory.fspeed);
    float fSteerCost = abs(tTrial.fsteer - mtLastTrajectory.fsteer);
    float fNormSpeedCost = fSpeedCost / 7;      //(MAX_SPEED - MIN_SPEED);
    float fNormSteerCost = fSteerCost / 0.8724; //(MAX_STEER - MIN_STEER);
    tTrial.fOscillationCost = 0.7f * fNormSteerCost + 0.3f * fNormSpeedCost;
}

void DwaPlanner::getDistanceCost(trajectory &tTrial)
{
    // 新的距离代价；dwa路径末端到关键点朝向直线的距离，这样可以先到直线上，再沿直线到达关键点，方便调整朝向
    float fFinalX = tTrial.vsStates.back().fx;
    float fFinalY = tTrial.vsStates.back().fy;
    // 点到直线距离公式
    tTrial.fDistanceCost = 10000 * std::pow(fabs((mpTargetHeading.fy - mpTarget.fy) * fFinalX - (mpTargetHeading.fx - mpTarget.fx) * fFinalY - mpTarget.fx * (mpTargetHeading.fy - mpTarget.fy) + mpTarget.fy * (mpTargetHeading.fx - mpTarget.fx)), 2.0) / ((mpTargetHeading.fy - mpTarget.fy) * (mpTargetHeading.fy - mpTarget.fy) + (mpTargetHeading.fx - mpTarget.fx) * (mpTargetHeading.fx - mpTarget.fx));
}

//dwa路径终点朝向   与   关键点朝向  夹角， 可以调整车身在到达关键点时的朝向
void DwaPlanner::getHeadingCost(trajectory &tTrial)
{
    //使用向量内积计算
    float fFinalYaw = tTrial.vsStates.back().fyaw;
    // Yaw向量 单位向量
    float fCosYaw = cos(fFinalYaw);
    float fSinYaw = sin(fFinalYaw);
    // 新的headingcost，比较了朝向向量和轨迹末端向量夹角；
    float fTargetHeadingNorm = sqrt(mpTar_Head_vec.fy * mpTar_Head_vec.fy + mpTar_Head_vec.fx * mpTar_Head_vec.fx);
    float fCosTargetHeading = mpTar_Head_vec.fx / fTargetHeadingNorm;
    float fSinTargetHeading = mpTar_Head_vec.fy / fTargetHeadingNorm;
    float fCosTargetHeadingAndYaw = fCosYaw * fCosTargetHeading + fSinYaw * fSinTargetHeading;
    if (tTrial.fspeed > 0)
    {
        tTrial.fHeadingCost = acos(fCosTargetHeadingAndYaw);
    }
    else
    {
        tTrial.fHeadingCost = 3.14159 - acos(fCosTargetHeadingAndYaw);
    }
}

// 可视化路径选取，blue(worst)-->green-->red(best)；
void DwaPlanner::pubVisTraj()
{
    visualization_msgs::MarkerArray visTraj;
    float ratio;
    int count = 0;

    for (int j = 0; j < mvtTrials.size(); j++)
    {
        for (int i = 0; i < mvtTrials[j].vsStates.size(); i++)
        {
            visualization_msgs::Marker p;
            p.header.frame_id = msFrame_id;
            p.header.stamp = ros::Time::now();
            p.id = count++;
            p.lifetime = ros::Duration(0.1);
            p.type = visualization_msgs::Marker::CUBE;
            p.scale.x = 2;
            p.scale.y = 0.2;
            p.scale.z = 1;
            p.color.a = 0.8;

            p.pose.position.x = mvtTrials[j].vsStates[i].fx;
            p.pose.position.y = mvtTrials[j].vsStates[i].fy;
            p.pose.orientation = tf::createQuaternionMsgFromYaw(mvtTrials[j].vsStates[i].fyaw);

            ratio = 2 * (mvtTrials[j].fTotalCost - mtBestTrajectory.fTotalCost) / (fMaxCost - mtBestTrajectory.fTotalCost);
            p.color.r = max(0.f, 1.f - ratio);
            p.color.b = max(0.f, ratio - 1.f);
            p.color.g = 1.f - p.color.r - p.color.b;

            visTraj.markers.push_back(p);
            count++;
        }
    }
    traj_pub.publish(visTraj);
}

void DwaPlanner::pubBestTrajAsPath()
{
    nav_msgs::Path path;
    path.header.stamp = ros::Time::now();
    path.header.frame_id = msFrame_id;

    for (int i = 0; i < mtBestTrajectory.vsStates.size(); i++)
    {
        geometry_msgs::PoseStamped this_pose_stamped;
        this_pose_stamped.pose.position.x = mtBestTrajectory.vsStates.at(i).fx;
        this_pose_stamped.pose.position.y = mtBestTrajectory.vsStates.at(i).fy;
        geometry_msgs::Quaternion goal_quat = tf::createQuaternionMsgFromYaw(mtBestTrajectory.vsStates.at(i).fyaw);
        this_pose_stamped.pose.orientation.x = goal_quat.x;
        this_pose_stamped.pose.orientation.y = goal_quat.y;
        this_pose_stamped.pose.orientation.z = goal_quat.z;
        this_pose_stamped.pose.orientation.w = goal_quat.w;
        this_pose_stamped.header.stamp = ros::Time::now();

        this_pose_stamped.header.frame_id = msFrame_id;
        path.poses.push_back(this_pose_stamped);
    }
    best_path_pub.publish(path);
}

void DwaPlanner::pubTrajAsPath(trajectory &tTrial)
{
    nav_msgs::Path path;
    path.header.stamp = ros::Time::now();
    path.header.frame_id = msFrame_id;

    for (int i = 0; i < tTrial.vsStates.size(); i++)
    {
        geometry_msgs::PoseStamped this_pose_stamped;
        this_pose_stamped.pose.position.x = tTrial.vsStates.at(i).fx;
        this_pose_stamped.pose.position.y = tTrial.vsStates.at(i).fy;
        geometry_msgs::Quaternion goal_quat = tf::createQuaternionMsgFromYaw(tTrial.vsStates.at(i).fyaw);
        this_pose_stamped.pose.orientation.x = goal_quat.x;
        this_pose_stamped.pose.orientation.y = goal_quat.y;
        this_pose_stamped.pose.orientation.z = goal_quat.z;
        this_pose_stamped.pose.orientation.w = goal_quat.w;
        this_pose_stamped.header.stamp = ros::Time::now();

        this_pose_stamped.header.frame_id = msFrame_id;
        path.poses.push_back(this_pose_stamped);
    }
    path_pub.publish(path);
}

void DwaPlanner::pubControlCmd()
{
    control_msgs::control_req control_req;

    float speed = mtBestTrajectory.fspeed;
    float steer = mtBestTrajectory.fsteer / PI * 180;
    // steer = min(max(steer, -25.0f), 25.0f);

    control_req.Vel_req = speed;
    control_req.Angle_req = -steer; // dwa 左负右正  vv6 左正右负
    // int rnd;
    // rnd = rand() % 20;
    if (dwa_state == 2)
    {
        // control_req.Angle_req = (380 + rnd) / 18.06;
    }
    // if (dwa_state == 4 && state3Count < 40)
     if (dwa_state == 4)
    {
        printf("Entering state3 and Stopping...\nThe state count is %d\n", state3Count);
        control_req.Angle_req = 0.0;
        control_req.Vel_req = 0.0;
        state3Count++;
    }

    // if (dwa_state == 4)
    //     control_req.Vel_req = 0;
    if (std::abs(speed - 0) <= 10e-5)
        control_req.Gear_req = 2;
    else if (speed < 0)
        control_req.Gear_req = 1;
    else
        control_req.Gear_req = 3;
    control_cmd_pub.publish(control_req);
    ROS_INFO("Speed: %f Steer: %f  Gear: %d", control_req.Vel_req, control_req.Angle_req, control_req.Gear_req);
}

void DwaPlanner::pubBestTrajCollisionMap()
{
    trajectory tTrial = mtBestTrajectory;
    int size = tTrial.vsStates.size();
    int upBound, lowBound, leftBound, rightBound;
    vector<state>::iterator iterState = tTrial.vsStates.begin();
    tTrial.bCollisionFlag = 0;

    nav_msgs::OccupancyGrid collision_map;
    collision_map.header.frame_id = "rslidar";
    collision_map.header.stamp = ros::Time::now();
    collision_map.info.resolution = mfResolution; // float32

    // dwa的地图坐标系与车辆固结，设置为前y右x， 但发过来的所有量都是前x左y
    collision_map.info.width = mfHeight; // 格数
    collision_map.info.height = mfWidth; // 格数
    collision_map.info.origin.position.x = mpOrigin.fy;
    collision_map.info.origin.position.y = -mpOrigin.fx;
    int data[collision_map.info.width * collision_map.info.height] = {-1}; // [0,100]
    int ox = collision_map.info.origin.position.x;
    int oy = collision_map.info.origin.position.y;
    float res = collision_map.info.resolution = mfResolution;
    int width = collision_map.info.width;

    for (; iterState != tTrial.vsStates.end(); iterState++)
    {
        // A 右上 B左上 C右下 D左下

        position fA, fB, fC, fD;
        map_point A, B, C, D; // 分别代表此时车的四个角点所在的栅格坐标int
        float x, y, yaw, sinyaw, cosyaw;

        x = (*iterState).fx;
        y = (*iterState).fy;
        yaw = (*iterState).fyaw;
        sinyaw = sin(yaw);
        cosyaw = cos(yaw);

        fA.fx = x + DWA_VEHICLE_H / 2 * sinyaw + VEHICLE_V_FRONT * cosyaw;
        fA.fy = y - DWA_VEHICLE_H / 2 * cosyaw + VEHICLE_V_FRONT * sinyaw;
        fB.fx = x - DWA_VEHICLE_H / 2 * sinyaw + VEHICLE_V_FRONT * cosyaw;
        fB.fy = y + DWA_VEHICLE_H / 2 * cosyaw + VEHICLE_V_FRONT * sinyaw;
        fC.fx = x + DWA_VEHICLE_H / 2 * sinyaw - VEHICLE_V_BACK * cosyaw;
        fC.fy = y - DWA_VEHICLE_H / 2 * cosyaw - VEHICLE_V_BACK * sinyaw;
        fD.fx = x - DWA_VEHICLE_H / 2 * sinyaw - VEHICLE_V_BACK * cosyaw;
        fD.fy = y + DWA_VEHICLE_H / 2 * cosyaw - VEHICLE_V_BACK * sinyaw;
        pubBestPolygon(fA, fB, fC, fD);
        float fupBound = fA.fy;
        float flowBound = fA.fy;
        float fleftBound = fA.fx;
        float frightBound = fA.fx;
        float fxs[4] = {fA.fx, fB.fx, fC.fx, fD.fx};
        float fys[4] = {fA.fy, fB.fy, fC.fy, fD.fy};
        //确定四个边界
        for (int i = 0; i < 4; i++)
        {
            fupBound = fys[i] > fupBound ? fys[i] : fupBound;
            flowBound = fys[i] < flowBound ? fys[i] : flowBound;
            fleftBound = fxs[i] < fleftBound ? fxs[i] : fleftBound;
            frightBound = fxs[i] > frightBound ? fxs[i] : frightBound;
        }
        if (iterState == tTrial.vsStates.begin())
        {
            fA.fx = x + VEHICLE_H / 2 * sinyaw + VEHICLE_V_FRONT * cosyaw;
            fA.fy = y - VEHICLE_H / 2 * cosyaw + VEHICLE_V_FRONT * sinyaw;
            fB.fx = x - VEHICLE_H / 2 * sinyaw + VEHICLE_V_FRONT * cosyaw;
            fB.fy = y + VEHICLE_H / 2 * cosyaw + VEHICLE_V_FRONT * sinyaw;
            fC.fx = x + VEHICLE_H / 2 * sinyaw - VEHICLE_V_BACK * cosyaw;
            fC.fy = y - VEHICLE_H / 2 * cosyaw - VEHICLE_V_BACK * sinyaw;
            fD.fx = x - VEHICLE_H / 2 * sinyaw - VEHICLE_V_BACK * cosyaw;
            fD.fy = y + VEHICLE_H / 2 * cosyaw - VEHICLE_V_BACK * sinyaw;
            float fupBound = fA.fy;
            float flowBound = fA.fy;
            float fleftBound = fA.fx;
            float frightBound = fA.fx;
            float fxs[4] = {fA.fx, fB.fx, fC.fx, fD.fx};
            float fys[4] = {fA.fy, fB.fy, fC.fy, fD.fy};
            //确定四个边界
            for (int i = 0; i < 4; i++)
            {
                fupBound = fys[i] > fupBound ? fys[i] : fupBound;
                flowBound = fys[i] < flowBound ? fys[i] : flowBound;
                fleftBound = fxs[i] < fleftBound ? fxs[i] : fleftBound;
                frightBound = fxs[i] > frightBound ? fxs[i] : frightBound;
            }
            pubBoundBox(fupBound, flowBound, fleftBound, frightBound);
        }
        A.nx = int((fA.fx - mpOrigin.fx) / mfResolution);
        A.ny = int((fA.fy - mpOrigin.fy) / mfResolution);
        B.nx = int((fB.fx - mpOrigin.fx) / mfResolution);
        B.ny = int((fB.fy - mpOrigin.fy) / mfResolution);
        C.nx = int((fC.fx - mpOrigin.fx) / mfResolution);
        C.ny = int((fC.fy - mpOrigin.fy) / mfResolution);
        D.nx = int((fD.fx - mpOrigin.fx) / mfResolution);
        D.ny = int((fD.fy - mpOrigin.fy) / mfResolution);

        //upBound = max(max(max(A.ny, B.ny), C.ny), D.ny); //手动递归 会不会影响效率？
        // 初始化 不能把他们初始化为0 会影响排序
        upBound = A.ny;
        lowBound = A.ny;
        leftBound = A.nx;
        rightBound = A.nx;
        int xs[4] = {A.nx, B.nx, C.nx, D.nx};
        int ys[4] = {A.ny, B.ny, C.ny, D.ny};
        //确定四个边界
        for (int i = 0; i < 4; i++)
        {
            upBound = ys[i] > upBound ? ys[i] : upBound;
            lowBound = ys[i] < lowBound ? ys[i] : lowBound;
            leftBound = xs[i] < leftBound ? xs[i] : leftBound;
            rightBound = xs[i] > rightBound ? xs[i] : rightBound;
        }

        //用直线画出区域进行检测
        //笔直向前 没有斜率 所有点都落在外接框里
        if (yaw == 0)
        {
            for (int i = leftBound; i < rightBound; i += 1)
                for (int j = lowBound; j < upBound; j += 1)
                { // dwa的地图坐标系与车辆固结，设置为前y右x， 但发过来的所有量都是前x左y
                    int index = j - i * width;
                    data[index] = 75;
                }
        }

        else
        {
            //包围框不与栅格地图平行，计算直线参数
            float kAC = (fA.fy - fC.fy) / (fA.fx - fC.fx);
            float kBD = (fB.fy - fD.fy) / (fB.fx - fD.fx);
            float kAB = (fA.fy - fB.fy) / (fA.fx - fB.fx);
            float kCD = (fC.fy - fD.fy) / (fC.fx - fD.fx);

            float bAC = fA.fy - kAC * fA.fx;
            float bBD = fB.fy - kBD * fB.fx;
            float bAB = fA.fy - kAB * fA.fx;
            float bCD = fC.fy - kCD * fC.fx;

            int nbAC = int((bAC - mpOrigin.fy) / mfResolution);
            int nbBD = int((bBD - mpOrigin.fy) / mfResolution);
            int nbAB = int((bAB - mpOrigin.fy) / mfResolution);
            int nbCD = int((bCD - mpOrigin.fy) / mfResolution);

            for (int i = leftBound; i < rightBound; i += 1)
                for (int j = lowBound; j < upBound; j += 1)
                {
                    //分开为了减少一行的量

                    float b1 = (j * mfResolution + mpOrigin.fy) - kAC * (i * mfResolution + mpOrigin.fx);
                    float b2 = (j * mfResolution + mpOrigin.fy) - kAB * (i * mfResolution + mpOrigin.fx);
                    bool isIn_1 = (b1 >= min(bAC, bBD) && b1 <= max(bAC, bBD));
                    bool isIn_2 = (b2 >= min(bAB, bCD) && b2 <= max(bAB, bCD));
                    if (isIn_1 && isIn_2)
                    {
                        // dwa的地图坐标系与车辆固结，设置为前y右x， 但发过来的所有量都是前x左y
                        int index = j - i * width;
                        data[index] = 75;
                    }
                }
        }
    }
    std::vector<signed char> a(data, data + collision_map.info.width * collision_map.info.height);
    collision_map.data = a;
    collision_map_pub.publish(collision_map); //dwa预测的各阶段的集合

    return;
}

void DwaPlanner::pubBestPolygon(position &pA, position &pB, position &pC, position &pD)
{
    geometry_msgs::PolygonStamped best_polygon_msg;
    best_polygon_msg.header.frame_id = msFrame_id;
    best_polygon_msg.header.stamp = ros::Time::now();

    geometry_msgs::Point32 A;
    geometry_msgs::Point32 B;
    geometry_msgs::Point32 C;
    geometry_msgs::Point32 D;

    A.x = pA.fx;
    A.y = pA.fy;
    B.x = pB.fx;
    B.y = pB.fy;
    C.x = pC.fx;
    C.y = pC.fy;
    D.x = pD.fx;
    D.y = pD.fy;

    best_polygon_msg.polygon.points.push_back(A);
    best_polygon_msg.polygon.points.push_back(C);
    best_polygon_msg.polygon.points.push_back(D);
    best_polygon_msg.polygon.points.push_back(B);

    best_polygon_pub.publish(best_polygon_msg);
}

void DwaPlanner::pubBoundBox(float &up, float &low, float &left, float &right)
{
    geometry_msgs::PolygonStamped bound_box_msg;
    bound_box_msg.header.frame_id = msFrame_id;
    bound_box_msg.header.stamp = ros::Time::now();

    geometry_msgs::Point32 A;
    geometry_msgs::Point32 B;
    geometry_msgs::Point32 C;
    geometry_msgs::Point32 D;

    A.x = right;
    A.y = up;
    B.x = left;
    B.y = up;
    C.x = right;
    C.y = low;
    D.x = left;
    D.y = low;

    bound_box_msg.polygon.points.push_back(A);
    bound_box_msg.polygon.points.push_back(C);
    bound_box_msg.polygon.points.push_back(D);
    bound_box_msg.polygon.points.push_back(B);

    bound_box_pub.publish(bound_box_msg);
}

void DwaPlanner::pubSimPosition(float fSimTime)
{
    // 取预测路径上的点作为下一秒的位置，先在dwa_viz坐标系下取 前y右x
    state sSimState = mtBestTrajectory.vsStates[int(fSimTime / dt)];
    sim_pose.header.stamp = ros::Time::now();
    sim_pose.header.frame_id = msFrame_id;
    sim_pose.pose.position.x = sSimState.fx;
    sim_pose.pose.position.y = sSimState.fy;

    sim_pose.pose.orientation = tf::createQuaternionMsgFromYaw(sSimState.fyaw);

    // 根据当前的map->rslidar->dwa_viz坐标系转换关系，拿到map下的sim_pose 然后更新rslidar在map下的位姿
    geometry_msgs::PoseStamped global_sim_pose;
    try
    {
        mTransformListener.transformPose("map", ros::Time(0), sim_pose, "dwa_viz", global_sim_pose);
    }
    catch (tf::TransformException &ex)
    {
        /* code for Catch */
        ROS_ERROR("dwa_planner: %s", ex.what());
        ros::Duration(0.1).sleep();
        return;
    }
    // sim_pose_pub.publish(global_sim_pose);
    // std::cout<<global_sim_pose.pose.orientation<<std::endl;
    // 拿到map下的旋转
    tf::Quaternion global_quad;
    global_quad.setX(global_sim_pose.pose.orientation.x);
    global_quad.setY(global_sim_pose.pose.orientation.y);
    global_quad.setZ(global_sim_pose.pose.orientation.z);
    global_quad.setW(global_sim_pose.pose.orientation.w);
    tf::Transform transform_map_rslidar = tf::Transform(global_quad,
                                                        tf::Vector3(global_sim_pose.pose.position.x,
                                                                    global_sim_pose.pose.position.y,
                                                                    global_sim_pose.pose.position.z));

    // tf::Transform transform_map_rslidar = tf::Transform(tf::Quaternion(1e-4, 1e-4, 1e-4, 1),
    //                                                     tf::Vector3(1, 0, 0));
    tf::StampedTransform stamped_trans = tf::StampedTransform(transform_map_rslidar, ros::Time::now(), "map", "rslidar"); // frame id: /base
    mTransformBroadcaster.sendTransform(stamped_trans);

    sim_pose_pub.publish(sim_pose);
    // ROS_INFO("publish sim pose");

    return;
}

int main(int argc, char *argv[])
{
    ros::init(argc, argv, "llllll");
    ros::NodeHandle nh("dwa_planner");
    string frame_id = "dwa_viz";

    if (getchar() != ' ')
    {
    }

    ROS_INFO("Start DWA Planner ...");
    DwaPlanner planner(nh, frame_id);
    ROS_INFO("DWA Planner Started");

    ros::Rate loop_rate(10);
    while (ros::ok())
    {
        ros::spinOnce();
        planner.StartLocalPlanner();
        // ROS_INFO("Local Planner Started...");
        loop_rate.sleep();
    }
    return 0;
}