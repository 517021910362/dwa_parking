;; Auto-generated. Do not edit!


(when (boundp 'parking_lot_msgs::parking_lot)
  (if (not (find-package "PARKING_LOT_MSGS"))
    (make-package "PARKING_LOT_MSGS"))
  (shadow 'parking_lot (find-package "PARKING_LOT_MSGS")))
(unless (find-package "PARKING_LOT_MSGS::PARKING_LOT")
  (make-package "PARKING_LOT_MSGS::PARKING_LOT"))

(in-package "ROS")
;;//! \htmlinclude parking_lot.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass parking_lot_msgs::parking_lot
  :super ros::object
  :slots (_header _corner_left_upper _corner_left_low _corner_right_upper _corner_right_low _center _entrance_center _type _is_occupied ))

(defmethod parking_lot_msgs::parking_lot
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:corner_left_upper __corner_left_upper) (instance geometry_msgs::Point :init))
    ((:corner_left_low __corner_left_low) (instance geometry_msgs::Point :init))
    ((:corner_right_upper __corner_right_upper) (instance geometry_msgs::Point :init))
    ((:corner_right_low __corner_right_low) (instance geometry_msgs::Point :init))
    ((:center __center) (instance geometry_msgs::Point :init))
    ((:entrance_center __entrance_center) (instance geometry_msgs::Point :init))
    ((:type __type) 0)
    ((:is_occupied __is_occupied) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _corner_left_upper __corner_left_upper)
   (setq _corner_left_low __corner_left_low)
   (setq _corner_right_upper __corner_right_upper)
   (setq _corner_right_low __corner_right_low)
   (setq _center __center)
   (setq _entrance_center __entrance_center)
   (setq _type (round __type))
   (setq _is_occupied (round __is_occupied))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:corner_left_upper
   (&rest __corner_left_upper)
   (if (keywordp (car __corner_left_upper))
       (send* _corner_left_upper __corner_left_upper)
     (progn
       (if __corner_left_upper (setq _corner_left_upper (car __corner_left_upper)))
       _corner_left_upper)))
  (:corner_left_low
   (&rest __corner_left_low)
   (if (keywordp (car __corner_left_low))
       (send* _corner_left_low __corner_left_low)
     (progn
       (if __corner_left_low (setq _corner_left_low (car __corner_left_low)))
       _corner_left_low)))
  (:corner_right_upper
   (&rest __corner_right_upper)
   (if (keywordp (car __corner_right_upper))
       (send* _corner_right_upper __corner_right_upper)
     (progn
       (if __corner_right_upper (setq _corner_right_upper (car __corner_right_upper)))
       _corner_right_upper)))
  (:corner_right_low
   (&rest __corner_right_low)
   (if (keywordp (car __corner_right_low))
       (send* _corner_right_low __corner_right_low)
     (progn
       (if __corner_right_low (setq _corner_right_low (car __corner_right_low)))
       _corner_right_low)))
  (:center
   (&rest __center)
   (if (keywordp (car __center))
       (send* _center __center)
     (progn
       (if __center (setq _center (car __center)))
       _center)))
  (:entrance_center
   (&rest __entrance_center)
   (if (keywordp (car __entrance_center))
       (send* _entrance_center __entrance_center)
     (progn
       (if __entrance_center (setq _entrance_center (car __entrance_center)))
       _entrance_center)))
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:is_occupied
   (&optional __is_occupied)
   (if __is_occupied (setq _is_occupied __is_occupied)) _is_occupied)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/Point _corner_left_upper
    (send _corner_left_upper :serialization-length)
    ;; geometry_msgs/Point _corner_left_low
    (send _corner_left_low :serialization-length)
    ;; geometry_msgs/Point _corner_right_upper
    (send _corner_right_upper :serialization-length)
    ;; geometry_msgs/Point _corner_right_low
    (send _corner_right_low :serialization-length)
    ;; geometry_msgs/Point _center
    (send _center :serialization-length)
    ;; geometry_msgs/Point _entrance_center
    (send _entrance_center :serialization-length)
    ;; int8 _type
    1
    ;; int8 _is_occupied
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/Point _corner_left_upper
       (send _corner_left_upper :serialize s)
     ;; geometry_msgs/Point _corner_left_low
       (send _corner_left_low :serialize s)
     ;; geometry_msgs/Point _corner_right_upper
       (send _corner_right_upper :serialize s)
     ;; geometry_msgs/Point _corner_right_low
       (send _corner_right_low :serialize s)
     ;; geometry_msgs/Point _center
       (send _center :serialize s)
     ;; geometry_msgs/Point _entrance_center
       (send _entrance_center :serialize s)
     ;; int8 _type
       (write-byte _type s)
     ;; int8 _is_occupied
       (write-byte _is_occupied s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/Point _corner_left_upper
     (send _corner_left_upper :deserialize buf ptr-) (incf ptr- (send _corner_left_upper :serialization-length))
   ;; geometry_msgs/Point _corner_left_low
     (send _corner_left_low :deserialize buf ptr-) (incf ptr- (send _corner_left_low :serialization-length))
   ;; geometry_msgs/Point _corner_right_upper
     (send _corner_right_upper :deserialize buf ptr-) (incf ptr- (send _corner_right_upper :serialization-length))
   ;; geometry_msgs/Point _corner_right_low
     (send _corner_right_low :deserialize buf ptr-) (incf ptr- (send _corner_right_low :serialization-length))
   ;; geometry_msgs/Point _center
     (send _center :deserialize buf ptr-) (incf ptr- (send _center :serialization-length))
   ;; geometry_msgs/Point _entrance_center
     (send _entrance_center :deserialize buf ptr-) (incf ptr- (send _entrance_center :serialization-length))
   ;; int8 _type
     (setq _type (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _type 127) (setq _type (- _type 256)))
   ;; int8 _is_occupied
     (setq _is_occupied (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _is_occupied 127) (setq _is_occupied (- _is_occupied 256)))
   ;;
   self)
  )

(setf (get parking_lot_msgs::parking_lot :md5sum-) "577a610f517c24e44cbfed4f97891954")
(setf (get parking_lot_msgs::parking_lot :datatype-) "parking_lot_msgs/parking_lot")
(setf (get parking_lot_msgs::parking_lot :definition-)
      "# 全局
Header header

# 车辆最终泊进车位时 从上往下看
geometry_msgs/Point corner_left_upper
geometry_msgs/Point corner_left_low
geometry_msgs/Point corner_right_upper
geometry_msgs/Point corner_right_low

geometry_msgs/Point center           # 方块的中心
geometry_msgs/Point entrance_center  # 入口边的中心

int8 type  # 0- 垂直  1 - 侧方位 
int8 is_occupied # 0- 无占据 1- 占据
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :parking_lot_msgs/parking_lot "577a610f517c24e44cbfed4f97891954")


