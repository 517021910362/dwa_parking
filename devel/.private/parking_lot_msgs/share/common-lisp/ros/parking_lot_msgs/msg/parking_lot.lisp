; Auto-generated. Do not edit!


(cl:in-package parking_lot_msgs-msg)


;//! \htmlinclude parking_lot.msg.html

(cl:defclass <parking_lot> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (corner_left_upper
    :reader corner_left_upper
    :initarg :corner_left_upper
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (corner_left_low
    :reader corner_left_low
    :initarg :corner_left_low
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (corner_right_upper
    :reader corner_right_upper
    :initarg :corner_right_upper
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (corner_right_low
    :reader corner_right_low
    :initarg :corner_right_low
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (center
    :reader center
    :initarg :center
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (entrance_center
    :reader entrance_center
    :initarg :entrance_center
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (type
    :reader type
    :initarg :type
    :type cl:fixnum
    :initform 0)
   (is_occupied
    :reader is_occupied
    :initarg :is_occupied
    :type cl:fixnum
    :initform 0))
)

(cl:defclass parking_lot (<parking_lot>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <parking_lot>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'parking_lot)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name parking_lot_msgs-msg:<parking_lot> is deprecated: use parking_lot_msgs-msg:parking_lot instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <parking_lot>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parking_lot_msgs-msg:header-val is deprecated.  Use parking_lot_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'corner_left_upper-val :lambda-list '(m))
(cl:defmethod corner_left_upper-val ((m <parking_lot>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parking_lot_msgs-msg:corner_left_upper-val is deprecated.  Use parking_lot_msgs-msg:corner_left_upper instead.")
  (corner_left_upper m))

(cl:ensure-generic-function 'corner_left_low-val :lambda-list '(m))
(cl:defmethod corner_left_low-val ((m <parking_lot>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parking_lot_msgs-msg:corner_left_low-val is deprecated.  Use parking_lot_msgs-msg:corner_left_low instead.")
  (corner_left_low m))

(cl:ensure-generic-function 'corner_right_upper-val :lambda-list '(m))
(cl:defmethod corner_right_upper-val ((m <parking_lot>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parking_lot_msgs-msg:corner_right_upper-val is deprecated.  Use parking_lot_msgs-msg:corner_right_upper instead.")
  (corner_right_upper m))

(cl:ensure-generic-function 'corner_right_low-val :lambda-list '(m))
(cl:defmethod corner_right_low-val ((m <parking_lot>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parking_lot_msgs-msg:corner_right_low-val is deprecated.  Use parking_lot_msgs-msg:corner_right_low instead.")
  (corner_right_low m))

(cl:ensure-generic-function 'center-val :lambda-list '(m))
(cl:defmethod center-val ((m <parking_lot>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parking_lot_msgs-msg:center-val is deprecated.  Use parking_lot_msgs-msg:center instead.")
  (center m))

(cl:ensure-generic-function 'entrance_center-val :lambda-list '(m))
(cl:defmethod entrance_center-val ((m <parking_lot>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parking_lot_msgs-msg:entrance_center-val is deprecated.  Use parking_lot_msgs-msg:entrance_center instead.")
  (entrance_center m))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <parking_lot>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parking_lot_msgs-msg:type-val is deprecated.  Use parking_lot_msgs-msg:type instead.")
  (type m))

(cl:ensure-generic-function 'is_occupied-val :lambda-list '(m))
(cl:defmethod is_occupied-val ((m <parking_lot>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader parking_lot_msgs-msg:is_occupied-val is deprecated.  Use parking_lot_msgs-msg:is_occupied instead.")
  (is_occupied m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <parking_lot>) ostream)
  "Serializes a message object of type '<parking_lot>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'corner_left_upper) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'corner_left_low) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'corner_right_upper) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'corner_right_low) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'center) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'entrance_center) ostream)
  (cl:let* ((signed (cl:slot-value msg 'type)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'is_occupied)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <parking_lot>) istream)
  "Deserializes a message object of type '<parking_lot>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'corner_left_upper) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'corner_left_low) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'corner_right_upper) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'corner_right_low) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'center) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'entrance_center) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'type) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'is_occupied) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<parking_lot>)))
  "Returns string type for a message object of type '<parking_lot>"
  "parking_lot_msgs/parking_lot")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'parking_lot)))
  "Returns string type for a message object of type 'parking_lot"
  "parking_lot_msgs/parking_lot")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<parking_lot>)))
  "Returns md5sum for a message object of type '<parking_lot>"
  "577a610f517c24e44cbfed4f97891954")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'parking_lot)))
  "Returns md5sum for a message object of type 'parking_lot"
  "577a610f517c24e44cbfed4f97891954")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<parking_lot>)))
  "Returns full string definition for message of type '<parking_lot>"
  (cl:format cl:nil "# 全局~%Header header~%~%# 车辆最终泊进车位时 从上往下看~%geometry_msgs/Point corner_left_upper~%geometry_msgs/Point corner_left_low~%geometry_msgs/Point corner_right_upper~%geometry_msgs/Point corner_right_low~%~%geometry_msgs/Point center           # 方块的中心~%geometry_msgs/Point entrance_center  # 入口边的中心~%~%int8 type  # 0- 垂直  1 - 侧方位 ~%int8 is_occupied # 0- 无占据 1- 占据~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'parking_lot)))
  "Returns full string definition for message of type 'parking_lot"
  (cl:format cl:nil "# 全局~%Header header~%~%# 车辆最终泊进车位时 从上往下看~%geometry_msgs/Point corner_left_upper~%geometry_msgs/Point corner_left_low~%geometry_msgs/Point corner_right_upper~%geometry_msgs/Point corner_right_low~%~%geometry_msgs/Point center           # 方块的中心~%geometry_msgs/Point entrance_center  # 入口边的中心~%~%int8 type  # 0- 垂直  1 - 侧方位 ~%int8 is_occupied # 0- 无占据 1- 占据~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <parking_lot>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'corner_left_upper))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'corner_left_low))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'corner_right_upper))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'corner_right_low))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'center))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'entrance_center))
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <parking_lot>))
  "Converts a ROS message object to a list"
  (cl:list 'parking_lot
    (cl:cons ':header (header msg))
    (cl:cons ':corner_left_upper (corner_left_upper msg))
    (cl:cons ':corner_left_low (corner_left_low msg))
    (cl:cons ':corner_right_upper (corner_right_upper msg))
    (cl:cons ':corner_right_low (corner_right_low msg))
    (cl:cons ':center (center msg))
    (cl:cons ':entrance_center (entrance_center msg))
    (cl:cons ':type (type msg))
    (cl:cons ':is_occupied (is_occupied msg))
))
