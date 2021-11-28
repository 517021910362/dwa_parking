;; Auto-generated. Do not edit!


(when (boundp 'vehicle_msgs::vehicle_upload)
  (if (not (find-package "VEHICLE_MSGS"))
    (make-package "VEHICLE_MSGS"))
  (shadow 'vehicle_upload (find-package "VEHICLE_MSGS")))
(unless (find-package "VEHICLE_MSGS::VEHICLE_UPLOAD")
  (make-package "VEHICLE_MSGS::VEHICLE_UPLOAD"))

(in-package "ROS")
;;//! \htmlinclude vehicle_upload.msg.html


(defclass vehicle_msgs::vehicle_upload
  :super ros::object
  :slots (_Vehicle_speed _Vehicle_speedQuality _EPS_SteerAng _EPS_SteerAngQuality _BMS_BattSOC _BMS_BattSOCQuality _Tar_gearFeed _Tar_gearFeedQuality _Drive_Mode ))

(defmethod vehicle_msgs::vehicle_upload
  (:init
   (&key
    ((:Vehicle_speed __Vehicle_speed) 0.0)
    ((:Vehicle_speedQuality __Vehicle_speedQuality) 0.0)
    ((:EPS_SteerAng __EPS_SteerAng) 0.0)
    ((:EPS_SteerAngQuality __EPS_SteerAngQuality) 0.0)
    ((:BMS_BattSOC __BMS_BattSOC) 0.0)
    ((:BMS_BattSOCQuality __BMS_BattSOCQuality) 0.0)
    ((:Tar_gearFeed __Tar_gearFeed) 0)
    ((:Tar_gearFeedQuality __Tar_gearFeedQuality) 0)
    ((:Drive_Mode __Drive_Mode) 0)
    )
   (send-super :init)
   (setq _Vehicle_speed (float __Vehicle_speed))
   (setq _Vehicle_speedQuality (float __Vehicle_speedQuality))
   (setq _EPS_SteerAng (float __EPS_SteerAng))
   (setq _EPS_SteerAngQuality (float __EPS_SteerAngQuality))
   (setq _BMS_BattSOC (float __BMS_BattSOC))
   (setq _BMS_BattSOCQuality (float __BMS_BattSOCQuality))
   (setq _Tar_gearFeed (round __Tar_gearFeed))
   (setq _Tar_gearFeedQuality (round __Tar_gearFeedQuality))
   (setq _Drive_Mode (round __Drive_Mode))
   self)
  (:Vehicle_speed
   (&optional __Vehicle_speed)
   (if __Vehicle_speed (setq _Vehicle_speed __Vehicle_speed)) _Vehicle_speed)
  (:Vehicle_speedQuality
   (&optional __Vehicle_speedQuality)
   (if __Vehicle_speedQuality (setq _Vehicle_speedQuality __Vehicle_speedQuality)) _Vehicle_speedQuality)
  (:EPS_SteerAng
   (&optional __EPS_SteerAng)
   (if __EPS_SteerAng (setq _EPS_SteerAng __EPS_SteerAng)) _EPS_SteerAng)
  (:EPS_SteerAngQuality
   (&optional __EPS_SteerAngQuality)
   (if __EPS_SteerAngQuality (setq _EPS_SteerAngQuality __EPS_SteerAngQuality)) _EPS_SteerAngQuality)
  (:BMS_BattSOC
   (&optional __BMS_BattSOC)
   (if __BMS_BattSOC (setq _BMS_BattSOC __BMS_BattSOC)) _BMS_BattSOC)
  (:BMS_BattSOCQuality
   (&optional __BMS_BattSOCQuality)
   (if __BMS_BattSOCQuality (setq _BMS_BattSOCQuality __BMS_BattSOCQuality)) _BMS_BattSOCQuality)
  (:Tar_gearFeed
   (&optional __Tar_gearFeed)
   (if __Tar_gearFeed (setq _Tar_gearFeed __Tar_gearFeed)) _Tar_gearFeed)
  (:Tar_gearFeedQuality
   (&optional __Tar_gearFeedQuality)
   (if __Tar_gearFeedQuality (setq _Tar_gearFeedQuality __Tar_gearFeedQuality)) _Tar_gearFeedQuality)
  (:Drive_Mode
   (&optional __Drive_Mode)
   (if __Drive_Mode (setq _Drive_Mode __Drive_Mode)) _Drive_Mode)
  (:serialization-length
   ()
   (+
    ;; float32 _Vehicle_speed
    4
    ;; float32 _Vehicle_speedQuality
    4
    ;; float32 _EPS_SteerAng
    4
    ;; float32 _EPS_SteerAngQuality
    4
    ;; float32 _BMS_BattSOC
    4
    ;; float32 _BMS_BattSOCQuality
    4
    ;; uint8 _Tar_gearFeed
    1
    ;; uint8 _Tar_gearFeedQuality
    1
    ;; uint8 _Drive_Mode
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _Vehicle_speed
       (sys::poke _Vehicle_speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Vehicle_speedQuality
       (sys::poke _Vehicle_speedQuality (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _EPS_SteerAng
       (sys::poke _EPS_SteerAng (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _EPS_SteerAngQuality
       (sys::poke _EPS_SteerAngQuality (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _BMS_BattSOC
       (sys::poke _BMS_BattSOC (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _BMS_BattSOCQuality
       (sys::poke _BMS_BattSOCQuality (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _Tar_gearFeed
       (write-byte _Tar_gearFeed s)
     ;; uint8 _Tar_gearFeedQuality
       (write-byte _Tar_gearFeedQuality s)
     ;; uint8 _Drive_Mode
       (write-byte _Drive_Mode s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _Vehicle_speed
     (setq _Vehicle_speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Vehicle_speedQuality
     (setq _Vehicle_speedQuality (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _EPS_SteerAng
     (setq _EPS_SteerAng (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _EPS_SteerAngQuality
     (setq _EPS_SteerAngQuality (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _BMS_BattSOC
     (setq _BMS_BattSOC (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _BMS_BattSOCQuality
     (setq _BMS_BattSOCQuality (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _Tar_gearFeed
     (setq _Tar_gearFeed (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Tar_gearFeedQuality
     (setq _Tar_gearFeedQuality (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Drive_Mode
     (setq _Drive_Mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get vehicle_msgs::vehicle_upload :md5sum-) "dd7e7d66aa61f766087ccedcc5b96655")
(setf (get vehicle_msgs::vehicle_upload :datatype-) "vehicle_msgs/vehicle_upload")
(setf (get vehicle_msgs::vehicle_upload :definition-)
      "float32 Vehicle_speed
float32 Vehicle_speedQuality
float32 EPS_SteerAng
float32 EPS_SteerAngQuality
float32 BMS_BattSOC
float32 BMS_BattSOCQuality
uint8 Tar_gearFeed
uint8 Tar_gearFeedQuality
uint8 Drive_Mode

")



(provide :vehicle_msgs/vehicle_upload "dd7e7d66aa61f766087ccedcc5b96655")


