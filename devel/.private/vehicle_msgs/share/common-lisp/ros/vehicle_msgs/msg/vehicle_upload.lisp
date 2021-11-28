; Auto-generated. Do not edit!


(cl:in-package vehicle_msgs-msg)


;//! \htmlinclude vehicle_upload.msg.html

(cl:defclass <vehicle_upload> (roslisp-msg-protocol:ros-message)
  ((Vehicle_speed
    :reader Vehicle_speed
    :initarg :Vehicle_speed
    :type cl:float
    :initform 0.0)
   (Vehicle_speedQuality
    :reader Vehicle_speedQuality
    :initarg :Vehicle_speedQuality
    :type cl:float
    :initform 0.0)
   (EPS_SteerAng
    :reader EPS_SteerAng
    :initarg :EPS_SteerAng
    :type cl:float
    :initform 0.0)
   (EPS_SteerAngQuality
    :reader EPS_SteerAngQuality
    :initarg :EPS_SteerAngQuality
    :type cl:float
    :initform 0.0)
   (BMS_BattSOC
    :reader BMS_BattSOC
    :initarg :BMS_BattSOC
    :type cl:float
    :initform 0.0)
   (BMS_BattSOCQuality
    :reader BMS_BattSOCQuality
    :initarg :BMS_BattSOCQuality
    :type cl:float
    :initform 0.0)
   (Tar_gearFeed
    :reader Tar_gearFeed
    :initarg :Tar_gearFeed
    :type cl:fixnum
    :initform 0)
   (Tar_gearFeedQuality
    :reader Tar_gearFeedQuality
    :initarg :Tar_gearFeedQuality
    :type cl:fixnum
    :initform 0)
   (Drive_Mode
    :reader Drive_Mode
    :initarg :Drive_Mode
    :type cl:fixnum
    :initform 0))
)

(cl:defclass vehicle_upload (<vehicle_upload>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <vehicle_upload>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'vehicle_upload)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name vehicle_msgs-msg:<vehicle_upload> is deprecated: use vehicle_msgs-msg:vehicle_upload instead.")))

(cl:ensure-generic-function 'Vehicle_speed-val :lambda-list '(m))
(cl:defmethod Vehicle_speed-val ((m <vehicle_upload>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Vehicle_speed-val is deprecated.  Use vehicle_msgs-msg:Vehicle_speed instead.")
  (Vehicle_speed m))

(cl:ensure-generic-function 'Vehicle_speedQuality-val :lambda-list '(m))
(cl:defmethod Vehicle_speedQuality-val ((m <vehicle_upload>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Vehicle_speedQuality-val is deprecated.  Use vehicle_msgs-msg:Vehicle_speedQuality instead.")
  (Vehicle_speedQuality m))

(cl:ensure-generic-function 'EPS_SteerAng-val :lambda-list '(m))
(cl:defmethod EPS_SteerAng-val ((m <vehicle_upload>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:EPS_SteerAng-val is deprecated.  Use vehicle_msgs-msg:EPS_SteerAng instead.")
  (EPS_SteerAng m))

(cl:ensure-generic-function 'EPS_SteerAngQuality-val :lambda-list '(m))
(cl:defmethod EPS_SteerAngQuality-val ((m <vehicle_upload>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:EPS_SteerAngQuality-val is deprecated.  Use vehicle_msgs-msg:EPS_SteerAngQuality instead.")
  (EPS_SteerAngQuality m))

(cl:ensure-generic-function 'BMS_BattSOC-val :lambda-list '(m))
(cl:defmethod BMS_BattSOC-val ((m <vehicle_upload>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:BMS_BattSOC-val is deprecated.  Use vehicle_msgs-msg:BMS_BattSOC instead.")
  (BMS_BattSOC m))

(cl:ensure-generic-function 'BMS_BattSOCQuality-val :lambda-list '(m))
(cl:defmethod BMS_BattSOCQuality-val ((m <vehicle_upload>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:BMS_BattSOCQuality-val is deprecated.  Use vehicle_msgs-msg:BMS_BattSOCQuality instead.")
  (BMS_BattSOCQuality m))

(cl:ensure-generic-function 'Tar_gearFeed-val :lambda-list '(m))
(cl:defmethod Tar_gearFeed-val ((m <vehicle_upload>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Tar_gearFeed-val is deprecated.  Use vehicle_msgs-msg:Tar_gearFeed instead.")
  (Tar_gearFeed m))

(cl:ensure-generic-function 'Tar_gearFeedQuality-val :lambda-list '(m))
(cl:defmethod Tar_gearFeedQuality-val ((m <vehicle_upload>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Tar_gearFeedQuality-val is deprecated.  Use vehicle_msgs-msg:Tar_gearFeedQuality instead.")
  (Tar_gearFeedQuality m))

(cl:ensure-generic-function 'Drive_Mode-val :lambda-list '(m))
(cl:defmethod Drive_Mode-val ((m <vehicle_upload>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Drive_Mode-val is deprecated.  Use vehicle_msgs-msg:Drive_Mode instead.")
  (Drive_Mode m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <vehicle_upload>) ostream)
  "Serializes a message object of type '<vehicle_upload>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Vehicle_speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Vehicle_speedQuality))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'EPS_SteerAng))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'EPS_SteerAngQuality))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'BMS_BattSOC))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'BMS_BattSOCQuality))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Tar_gearFeed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Tar_gearFeedQuality)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Drive_Mode)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <vehicle_upload>) istream)
  "Deserializes a message object of type '<vehicle_upload>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Vehicle_speed) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Vehicle_speedQuality) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'EPS_SteerAng) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'EPS_SteerAngQuality) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'BMS_BattSOC) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'BMS_BattSOCQuality) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Tar_gearFeed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Tar_gearFeedQuality)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Drive_Mode)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<vehicle_upload>)))
  "Returns string type for a message object of type '<vehicle_upload>"
  "vehicle_msgs/vehicle_upload")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'vehicle_upload)))
  "Returns string type for a message object of type 'vehicle_upload"
  "vehicle_msgs/vehicle_upload")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<vehicle_upload>)))
  "Returns md5sum for a message object of type '<vehicle_upload>"
  "dd7e7d66aa61f766087ccedcc5b96655")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'vehicle_upload)))
  "Returns md5sum for a message object of type 'vehicle_upload"
  "dd7e7d66aa61f766087ccedcc5b96655")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<vehicle_upload>)))
  "Returns full string definition for message of type '<vehicle_upload>"
  (cl:format cl:nil "float32 Vehicle_speed~%float32 Vehicle_speedQuality~%float32 EPS_SteerAng~%float32 EPS_SteerAngQuality~%float32 BMS_BattSOC~%float32 BMS_BattSOCQuality~%uint8 Tar_gearFeed~%uint8 Tar_gearFeedQuality~%uint8 Drive_Mode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'vehicle_upload)))
  "Returns full string definition for message of type 'vehicle_upload"
  (cl:format cl:nil "float32 Vehicle_speed~%float32 Vehicle_speedQuality~%float32 EPS_SteerAng~%float32 EPS_SteerAngQuality~%float32 BMS_BattSOC~%float32 BMS_BattSOCQuality~%uint8 Tar_gearFeed~%uint8 Tar_gearFeedQuality~%uint8 Drive_Mode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <vehicle_upload>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <vehicle_upload>))
  "Converts a ROS message object to a list"
  (cl:list 'vehicle_upload
    (cl:cons ':Vehicle_speed (Vehicle_speed msg))
    (cl:cons ':Vehicle_speedQuality (Vehicle_speedQuality msg))
    (cl:cons ':EPS_SteerAng (EPS_SteerAng msg))
    (cl:cons ':EPS_SteerAngQuality (EPS_SteerAngQuality msg))
    (cl:cons ':BMS_BattSOC (BMS_BattSOC msg))
    (cl:cons ':BMS_BattSOCQuality (BMS_BattSOCQuality msg))
    (cl:cons ':Tar_gearFeed (Tar_gearFeed msg))
    (cl:cons ':Tar_gearFeedQuality (Tar_gearFeedQuality msg))
    (cl:cons ':Drive_Mode (Drive_Mode msg))
))
