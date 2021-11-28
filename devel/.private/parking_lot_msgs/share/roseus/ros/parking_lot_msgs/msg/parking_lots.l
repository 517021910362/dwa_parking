;; Auto-generated. Do not edit!


(when (boundp 'parking_lot_msgs::parking_lots)
  (if (not (find-package "PARKING_LOT_MSGS"))
    (make-package "PARKING_LOT_MSGS"))
  (shadow 'parking_lots (find-package "PARKING_LOT_MSGS")))
(unless (find-package "PARKING_LOT_MSGS::PARKING_LOTS")
  (make-package "PARKING_LOT_MSGS::PARKING_LOTS"))

(in-package "ROS")
;;//! \htmlinclude parking_lots.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass parking_lot_msgs::parking_lots
  :super ros::object
  :slots (_header _parking_lots ))

(defmethod parking_lot_msgs::parking_lots
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:parking_lots __parking_lots) (let (r) (dotimes (i 0) (push (instance parking_lot_msgs::parking_lot :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _parking_lots __parking_lots)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:parking_lots
   (&rest __parking_lots)
   (if (keywordp (car __parking_lots))
       (send* _parking_lots __parking_lots)
     (progn
       (if __parking_lots (setq _parking_lots (car __parking_lots)))
       _parking_lots)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; parking_lot_msgs/parking_lot[] _parking_lots
    (apply #'+ (send-all _parking_lots :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; parking_lot_msgs/parking_lot[] _parking_lots
     (write-long (length _parking_lots) s)
     (dolist (elem _parking_lots)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; parking_lot_msgs/parking_lot[] _parking_lots
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _parking_lots (let (r) (dotimes (i n) (push (instance parking_lot_msgs::parking_lot :init) r)) r))
     (dolist (elem- _parking_lots)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get parking_lot_msgs::parking_lots :md5sum-) "192e520702045372955648661836b8ae")
(setf (get parking_lot_msgs::parking_lots :datatype-) "parking_lot_msgs/parking_lots")
(setf (get parking_lot_msgs::parking_lots :definition-)
      "# 全局
Header header
parking_lot[] parking_lots

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
MSG: parking_lot_msgs/parking_lot
# 全局
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
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :parking_lot_msgs/parking_lots "192e520702045372955648661836b8ae")


