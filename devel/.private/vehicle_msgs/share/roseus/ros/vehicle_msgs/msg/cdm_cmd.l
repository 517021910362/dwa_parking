;; Auto-generated. Do not edit!


(when (boundp 'vehicle_msgs::cdm_cmd)
  (if (not (find-package "VEHICLE_MSGS"))
    (make-package "VEHICLE_MSGS"))
  (shadow 'cdm_cmd (find-package "VEHICLE_MSGS")))
(unless (find-package "VEHICLE_MSGS::CDM_CMD")
  (make-package "VEHICLE_MSGS::CDM_CMD"))

(in-package "ROS")
;;//! \htmlinclude cdm_cmd.msg.html


(defclass vehicle_msgs::cdm_cmd
  :super ros::object
  :slots (_Veh_Mass _Front_Hydraulic_BrakeFd _Rear_Hydraulic_BrakeFd _DriveModeFd _Load_BrakeFd _Compartment_Fd _Vehicle_FaultLevel _Veh_Spd _Fuel_Signal _Engine_Speed _TCM_GearFd _Steer_fd _Lat_State ))

(defmethod vehicle_msgs::cdm_cmd
  (:init
   (&key
    ((:Veh_Mass __Veh_Mass) 0)
    ((:Front_Hydraulic_BrakeFd __Front_Hydraulic_BrakeFd) 0)
    ((:Rear_Hydraulic_BrakeFd __Rear_Hydraulic_BrakeFd) 0)
    ((:DriveModeFd __DriveModeFd) 0)
    ((:Load_BrakeFd __Load_BrakeFd) 0)
    ((:Compartment_Fd __Compartment_Fd) 0)
    ((:Vehicle_FaultLevel __Vehicle_FaultLevel) 0)
    ((:Veh_Spd __Veh_Spd) 0.0)
    ((:Fuel_Signal __Fuel_Signal) 0)
    ((:Engine_Speed __Engine_Speed) 0)
    ((:TCM_GearFd __TCM_GearFd) 0)
    ((:Steer_fd __Steer_fd) 0)
    ((:Lat_State __Lat_State) 0)
    )
   (send-super :init)
   (setq _Veh_Mass (round __Veh_Mass))
   (setq _Front_Hydraulic_BrakeFd (round __Front_Hydraulic_BrakeFd))
   (setq _Rear_Hydraulic_BrakeFd (round __Rear_Hydraulic_BrakeFd))
   (setq _DriveModeFd (round __DriveModeFd))
   (setq _Load_BrakeFd (round __Load_BrakeFd))
   (setq _Compartment_Fd (round __Compartment_Fd))
   (setq _Vehicle_FaultLevel (round __Vehicle_FaultLevel))
   (setq _Veh_Spd (float __Veh_Spd))
   (setq _Fuel_Signal (round __Fuel_Signal))
   (setq _Engine_Speed (round __Engine_Speed))
   (setq _TCM_GearFd (round __TCM_GearFd))
   (setq _Steer_fd (round __Steer_fd))
   (setq _Lat_State (round __Lat_State))
   self)
  (:Veh_Mass
   (&optional __Veh_Mass)
   (if __Veh_Mass (setq _Veh_Mass __Veh_Mass)) _Veh_Mass)
  (:Front_Hydraulic_BrakeFd
   (&optional __Front_Hydraulic_BrakeFd)
   (if __Front_Hydraulic_BrakeFd (setq _Front_Hydraulic_BrakeFd __Front_Hydraulic_BrakeFd)) _Front_Hydraulic_BrakeFd)
  (:Rear_Hydraulic_BrakeFd
   (&optional __Rear_Hydraulic_BrakeFd)
   (if __Rear_Hydraulic_BrakeFd (setq _Rear_Hydraulic_BrakeFd __Rear_Hydraulic_BrakeFd)) _Rear_Hydraulic_BrakeFd)
  (:DriveModeFd
   (&optional __DriveModeFd)
   (if __DriveModeFd (setq _DriveModeFd __DriveModeFd)) _DriveModeFd)
  (:Load_BrakeFd
   (&optional __Load_BrakeFd)
   (if __Load_BrakeFd (setq _Load_BrakeFd __Load_BrakeFd)) _Load_BrakeFd)
  (:Compartment_Fd
   (&optional __Compartment_Fd)
   (if __Compartment_Fd (setq _Compartment_Fd __Compartment_Fd)) _Compartment_Fd)
  (:Vehicle_FaultLevel
   (&optional __Vehicle_FaultLevel)
   (if __Vehicle_FaultLevel (setq _Vehicle_FaultLevel __Vehicle_FaultLevel)) _Vehicle_FaultLevel)
  (:Veh_Spd
   (&optional __Veh_Spd)
   (if __Veh_Spd (setq _Veh_Spd __Veh_Spd)) _Veh_Spd)
  (:Fuel_Signal
   (&optional __Fuel_Signal)
   (if __Fuel_Signal (setq _Fuel_Signal __Fuel_Signal)) _Fuel_Signal)
  (:Engine_Speed
   (&optional __Engine_Speed)
   (if __Engine_Speed (setq _Engine_Speed __Engine_Speed)) _Engine_Speed)
  (:TCM_GearFd
   (&optional __TCM_GearFd)
   (if __TCM_GearFd (setq _TCM_GearFd __TCM_GearFd)) _TCM_GearFd)
  (:Steer_fd
   (&optional __Steer_fd)
   (if __Steer_fd (setq _Steer_fd __Steer_fd)) _Steer_fd)
  (:Lat_State
   (&optional __Lat_State)
   (if __Lat_State (setq _Lat_State __Lat_State)) _Lat_State)
  (:serialization-length
   ()
   (+
    ;; uint8 _Veh_Mass
    1
    ;; uint8 _Front_Hydraulic_BrakeFd
    1
    ;; uint8 _Rear_Hydraulic_BrakeFd
    1
    ;; uint8 _DriveModeFd
    1
    ;; uint8 _Load_BrakeFd
    1
    ;; uint8 _Compartment_Fd
    1
    ;; uint8 _Vehicle_FaultLevel
    1
    ;; float32 _Veh_Spd
    4
    ;; uint8 _Fuel_Signal
    1
    ;; uint16 _Engine_Speed
    2
    ;; int8 _TCM_GearFd
    1
    ;; uint32 _Steer_fd
    4
    ;; uint8 _Lat_State
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _Veh_Mass
       (write-byte _Veh_Mass s)
     ;; uint8 _Front_Hydraulic_BrakeFd
       (write-byte _Front_Hydraulic_BrakeFd s)
     ;; uint8 _Rear_Hydraulic_BrakeFd
       (write-byte _Rear_Hydraulic_BrakeFd s)
     ;; uint8 _DriveModeFd
       (write-byte _DriveModeFd s)
     ;; uint8 _Load_BrakeFd
       (write-byte _Load_BrakeFd s)
     ;; uint8 _Compartment_Fd
       (write-byte _Compartment_Fd s)
     ;; uint8 _Vehicle_FaultLevel
       (write-byte _Vehicle_FaultLevel s)
     ;; float32 _Veh_Spd
       (sys::poke _Veh_Spd (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _Fuel_Signal
       (write-byte _Fuel_Signal s)
     ;; uint16 _Engine_Speed
       (write-word _Engine_Speed s)
     ;; int8 _TCM_GearFd
       (write-byte _TCM_GearFd s)
     ;; uint32 _Steer_fd
       (write-long _Steer_fd s)
     ;; uint8 _Lat_State
       (write-byte _Lat_State s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _Veh_Mass
     (setq _Veh_Mass (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Front_Hydraulic_BrakeFd
     (setq _Front_Hydraulic_BrakeFd (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Rear_Hydraulic_BrakeFd
     (setq _Rear_Hydraulic_BrakeFd (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _DriveModeFd
     (setq _DriveModeFd (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Load_BrakeFd
     (setq _Load_BrakeFd (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Compartment_Fd
     (setq _Compartment_Fd (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Vehicle_FaultLevel
     (setq _Vehicle_FaultLevel (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _Veh_Spd
     (setq _Veh_Spd (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _Fuel_Signal
     (setq _Fuel_Signal (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint16 _Engine_Speed
     (setq _Engine_Speed (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int8 _TCM_GearFd
     (setq _TCM_GearFd (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _TCM_GearFd 127) (setq _TCM_GearFd (- _TCM_GearFd 256)))
   ;; uint32 _Steer_fd
     (setq _Steer_fd (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint8 _Lat_State
     (setq _Lat_State (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get vehicle_msgs::cdm_cmd :md5sum-) "7b69952894d338c32418394971da76f8")
(setf (get vehicle_msgs::cdm_cmd :datatype-) "vehicle_msgs/cdm_cmd")
(setf (get vehicle_msgs::cdm_cmd :definition-)
      "uint8 Veh_Mass
uint8 Front_Hydraulic_BrakeFd
uint8 Rear_Hydraulic_BrakeFd
uint8 DriveModeFd
uint8 Load_BrakeFd
#uint8 Compartment_Up
#uint8 Compartment_Down
#uint8 Compartment_UpHighest
#uint8 Compartment_UpLowest
uint8 Compartment_Fd
uint8 Vehicle_FaultLevel
float32 Veh_Spd
uint8 Fuel_Signal
uint16 Engine_Speed
int8 TCM_GearFd
uint32 Steer_fd
uint8 Lat_State
")



(provide :vehicle_msgs/cdm_cmd "7b69952894d338c32418394971da76f8")


