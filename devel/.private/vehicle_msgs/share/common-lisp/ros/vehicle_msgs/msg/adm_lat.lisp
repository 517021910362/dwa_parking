; Auto-generated. Do not edit!


(cl:in-package vehicle_msgs-msg)


;//! \htmlinclude adm_lat.msg.html

(cl:defclass <adm_lat> (roslisp-msg-protocol:ros-message)
  ((Enable_lat
    :reader Enable_lat
    :initarg :Enable_lat
    :type cl:fixnum
    :initform 0)
   (GPS1_Curvature_cmd
    :reader GPS1_Curvature_cmd
    :initarg :GPS1_Curvature_cmd
    :type cl:float
    :initform 0.0)
   (V_des
    :reader V_des
    :initarg :V_des
    :type cl:float
    :initform 0.0)
   (Gear_des
    :reader Gear_des
    :initarg :Gear_des
    :type cl:fixnum
    :initform 0)
   (End
    :reader End
    :initarg :End
    :type cl:fixnum
    :initform 0)
   (Objectfalse
    :reader Objectfalse
    :initarg :Objectfalse
    :type cl:fixnum
    :initform 0)
   (obs_dis
    :reader obs_dis
    :initarg :obs_dis
    :type cl:float
    :initform 0.0)
   (steering_wheel_angle
    :reader steering_wheel_angle
    :initarg :steering_wheel_angle
    :type cl:float
    :initform 0.0)
   (lateral_offset
    :reader lateral_offset
    :initarg :lateral_offset
    :type cl:float
    :initform 0.0)
   (current_ind
    :reader current_ind
    :initarg :current_ind
    :type cl:fixnum
    :initform 0))
)

(cl:defclass adm_lat (<adm_lat>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <adm_lat>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'adm_lat)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name vehicle_msgs-msg:<adm_lat> is deprecated: use vehicle_msgs-msg:adm_lat instead.")))

(cl:ensure-generic-function 'Enable_lat-val :lambda-list '(m))
(cl:defmethod Enable_lat-val ((m <adm_lat>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Enable_lat-val is deprecated.  Use vehicle_msgs-msg:Enable_lat instead.")
  (Enable_lat m))

(cl:ensure-generic-function 'GPS1_Curvature_cmd-val :lambda-list '(m))
(cl:defmethod GPS1_Curvature_cmd-val ((m <adm_lat>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:GPS1_Curvature_cmd-val is deprecated.  Use vehicle_msgs-msg:GPS1_Curvature_cmd instead.")
  (GPS1_Curvature_cmd m))

(cl:ensure-generic-function 'V_des-val :lambda-list '(m))
(cl:defmethod V_des-val ((m <adm_lat>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:V_des-val is deprecated.  Use vehicle_msgs-msg:V_des instead.")
  (V_des m))

(cl:ensure-generic-function 'Gear_des-val :lambda-list '(m))
(cl:defmethod Gear_des-val ((m <adm_lat>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Gear_des-val is deprecated.  Use vehicle_msgs-msg:Gear_des instead.")
  (Gear_des m))

(cl:ensure-generic-function 'End-val :lambda-list '(m))
(cl:defmethod End-val ((m <adm_lat>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:End-val is deprecated.  Use vehicle_msgs-msg:End instead.")
  (End m))

(cl:ensure-generic-function 'Objectfalse-val :lambda-list '(m))
(cl:defmethod Objectfalse-val ((m <adm_lat>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Objectfalse-val is deprecated.  Use vehicle_msgs-msg:Objectfalse instead.")
  (Objectfalse m))

(cl:ensure-generic-function 'obs_dis-val :lambda-list '(m))
(cl:defmethod obs_dis-val ((m <adm_lat>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:obs_dis-val is deprecated.  Use vehicle_msgs-msg:obs_dis instead.")
  (obs_dis m))

(cl:ensure-generic-function 'steering_wheel_angle-val :lambda-list '(m))
(cl:defmethod steering_wheel_angle-val ((m <adm_lat>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:steering_wheel_angle-val is deprecated.  Use vehicle_msgs-msg:steering_wheel_angle instead.")
  (steering_wheel_angle m))

(cl:ensure-generic-function 'lateral_offset-val :lambda-list '(m))
(cl:defmethod lateral_offset-val ((m <adm_lat>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:lateral_offset-val is deprecated.  Use vehicle_msgs-msg:lateral_offset instead.")
  (lateral_offset m))

(cl:ensure-generic-function 'current_ind-val :lambda-list '(m))
(cl:defmethod current_ind-val ((m <adm_lat>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:current_ind-val is deprecated.  Use vehicle_msgs-msg:current_ind instead.")
  (current_ind m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <adm_lat>) ostream)
  "Serializes a message object of type '<adm_lat>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Enable_lat)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'GPS1_Curvature_cmd))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'V_des))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'Gear_des)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'End)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Objectfalse)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'obs_dis))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'steering_wheel_angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'lateral_offset))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'current_ind)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <adm_lat>) istream)
  "Deserializes a message object of type '<adm_lat>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Enable_lat)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'GPS1_Curvature_cmd) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'V_des) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Gear_des) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'End)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Objectfalse)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'obs_dis) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'steering_wheel_angle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'lateral_offset) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'current_ind) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<adm_lat>)))
  "Returns string type for a message object of type '<adm_lat>"
  "vehicle_msgs/adm_lat")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'adm_lat)))
  "Returns string type for a message object of type 'adm_lat"
  "vehicle_msgs/adm_lat")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<adm_lat>)))
  "Returns md5sum for a message object of type '<adm_lat>"
  "093d38f791b755925ba9f28e5792bd0c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'adm_lat)))
  "Returns md5sum for a message object of type 'adm_lat"
  "093d38f791b755925ba9f28e5792bd0c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<adm_lat>)))
  "Returns full string definition for message of type '<adm_lat>"
  (cl:format cl:nil "uint8 Enable_lat~%float32 GPS1_Curvature_cmd~%float32 V_des~%int8 Gear_des~%uint8 End~%uint8 Objectfalse~%float32 obs_dis~%float32 steering_wheel_angle~%float32 lateral_offset~%int16 current_ind~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'adm_lat)))
  "Returns full string definition for message of type 'adm_lat"
  (cl:format cl:nil "uint8 Enable_lat~%float32 GPS1_Curvature_cmd~%float32 V_des~%int8 Gear_des~%uint8 End~%uint8 Objectfalse~%float32 obs_dis~%float32 steering_wheel_angle~%float32 lateral_offset~%int16 current_ind~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <adm_lat>))
  (cl:+ 0
     1
     4
     4
     1
     1
     1
     4
     4
     4
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <adm_lat>))
  "Converts a ROS message object to a list"
  (cl:list 'adm_lat
    (cl:cons ':Enable_lat (Enable_lat msg))
    (cl:cons ':GPS1_Curvature_cmd (GPS1_Curvature_cmd msg))
    (cl:cons ':V_des (V_des msg))
    (cl:cons ':Gear_des (Gear_des msg))
    (cl:cons ':End (End msg))
    (cl:cons ':Objectfalse (Objectfalse msg))
    (cl:cons ':obs_dis (obs_dis msg))
    (cl:cons ':steering_wheel_angle (steering_wheel_angle msg))
    (cl:cons ':lateral_offset (lateral_offset msg))
    (cl:cons ':current_ind (current_ind msg))
))
