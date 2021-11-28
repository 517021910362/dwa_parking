; Auto-generated. Do not edit!


(cl:in-package vehicle_msgs-msg)


;//! \htmlinclude cdm_cmd.msg.html

(cl:defclass <cdm_cmd> (roslisp-msg-protocol:ros-message)
  ((Veh_Mass
    :reader Veh_Mass
    :initarg :Veh_Mass
    :type cl:fixnum
    :initform 0)
   (Front_Hydraulic_BrakeFd
    :reader Front_Hydraulic_BrakeFd
    :initarg :Front_Hydraulic_BrakeFd
    :type cl:fixnum
    :initform 0)
   (Rear_Hydraulic_BrakeFd
    :reader Rear_Hydraulic_BrakeFd
    :initarg :Rear_Hydraulic_BrakeFd
    :type cl:fixnum
    :initform 0)
   (DriveModeFd
    :reader DriveModeFd
    :initarg :DriveModeFd
    :type cl:fixnum
    :initform 0)
   (Load_BrakeFd
    :reader Load_BrakeFd
    :initarg :Load_BrakeFd
    :type cl:fixnum
    :initform 0)
   (Compartment_Fd
    :reader Compartment_Fd
    :initarg :Compartment_Fd
    :type cl:fixnum
    :initform 0)
   (Vehicle_FaultLevel
    :reader Vehicle_FaultLevel
    :initarg :Vehicle_FaultLevel
    :type cl:fixnum
    :initform 0)
   (Veh_Spd
    :reader Veh_Spd
    :initarg :Veh_Spd
    :type cl:float
    :initform 0.0)
   (Fuel_Signal
    :reader Fuel_Signal
    :initarg :Fuel_Signal
    :type cl:fixnum
    :initform 0)
   (Engine_Speed
    :reader Engine_Speed
    :initarg :Engine_Speed
    :type cl:fixnum
    :initform 0)
   (TCM_GearFd
    :reader TCM_GearFd
    :initarg :TCM_GearFd
    :type cl:fixnum
    :initform 0)
   (Steer_fd
    :reader Steer_fd
    :initarg :Steer_fd
    :type cl:integer
    :initform 0)
   (Lat_State
    :reader Lat_State
    :initarg :Lat_State
    :type cl:fixnum
    :initform 0))
)

(cl:defclass cdm_cmd (<cdm_cmd>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <cdm_cmd>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'cdm_cmd)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name vehicle_msgs-msg:<cdm_cmd> is deprecated: use vehicle_msgs-msg:cdm_cmd instead.")))

(cl:ensure-generic-function 'Veh_Mass-val :lambda-list '(m))
(cl:defmethod Veh_Mass-val ((m <cdm_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Veh_Mass-val is deprecated.  Use vehicle_msgs-msg:Veh_Mass instead.")
  (Veh_Mass m))

(cl:ensure-generic-function 'Front_Hydraulic_BrakeFd-val :lambda-list '(m))
(cl:defmethod Front_Hydraulic_BrakeFd-val ((m <cdm_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Front_Hydraulic_BrakeFd-val is deprecated.  Use vehicle_msgs-msg:Front_Hydraulic_BrakeFd instead.")
  (Front_Hydraulic_BrakeFd m))

(cl:ensure-generic-function 'Rear_Hydraulic_BrakeFd-val :lambda-list '(m))
(cl:defmethod Rear_Hydraulic_BrakeFd-val ((m <cdm_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Rear_Hydraulic_BrakeFd-val is deprecated.  Use vehicle_msgs-msg:Rear_Hydraulic_BrakeFd instead.")
  (Rear_Hydraulic_BrakeFd m))

(cl:ensure-generic-function 'DriveModeFd-val :lambda-list '(m))
(cl:defmethod DriveModeFd-val ((m <cdm_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:DriveModeFd-val is deprecated.  Use vehicle_msgs-msg:DriveModeFd instead.")
  (DriveModeFd m))

(cl:ensure-generic-function 'Load_BrakeFd-val :lambda-list '(m))
(cl:defmethod Load_BrakeFd-val ((m <cdm_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Load_BrakeFd-val is deprecated.  Use vehicle_msgs-msg:Load_BrakeFd instead.")
  (Load_BrakeFd m))

(cl:ensure-generic-function 'Compartment_Fd-val :lambda-list '(m))
(cl:defmethod Compartment_Fd-val ((m <cdm_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Compartment_Fd-val is deprecated.  Use vehicle_msgs-msg:Compartment_Fd instead.")
  (Compartment_Fd m))

(cl:ensure-generic-function 'Vehicle_FaultLevel-val :lambda-list '(m))
(cl:defmethod Vehicle_FaultLevel-val ((m <cdm_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Vehicle_FaultLevel-val is deprecated.  Use vehicle_msgs-msg:Vehicle_FaultLevel instead.")
  (Vehicle_FaultLevel m))

(cl:ensure-generic-function 'Veh_Spd-val :lambda-list '(m))
(cl:defmethod Veh_Spd-val ((m <cdm_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Veh_Spd-val is deprecated.  Use vehicle_msgs-msg:Veh_Spd instead.")
  (Veh_Spd m))

(cl:ensure-generic-function 'Fuel_Signal-val :lambda-list '(m))
(cl:defmethod Fuel_Signal-val ((m <cdm_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Fuel_Signal-val is deprecated.  Use vehicle_msgs-msg:Fuel_Signal instead.")
  (Fuel_Signal m))

(cl:ensure-generic-function 'Engine_Speed-val :lambda-list '(m))
(cl:defmethod Engine_Speed-val ((m <cdm_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Engine_Speed-val is deprecated.  Use vehicle_msgs-msg:Engine_Speed instead.")
  (Engine_Speed m))

(cl:ensure-generic-function 'TCM_GearFd-val :lambda-list '(m))
(cl:defmethod TCM_GearFd-val ((m <cdm_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:TCM_GearFd-val is deprecated.  Use vehicle_msgs-msg:TCM_GearFd instead.")
  (TCM_GearFd m))

(cl:ensure-generic-function 'Steer_fd-val :lambda-list '(m))
(cl:defmethod Steer_fd-val ((m <cdm_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Steer_fd-val is deprecated.  Use vehicle_msgs-msg:Steer_fd instead.")
  (Steer_fd m))

(cl:ensure-generic-function 'Lat_State-val :lambda-list '(m))
(cl:defmethod Lat_State-val ((m <cdm_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Lat_State-val is deprecated.  Use vehicle_msgs-msg:Lat_State instead.")
  (Lat_State m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <cdm_cmd>) ostream)
  "Serializes a message object of type '<cdm_cmd>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Veh_Mass)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Front_Hydraulic_BrakeFd)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Rear_Hydraulic_BrakeFd)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'DriveModeFd)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Load_BrakeFd)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Compartment_Fd)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Vehicle_FaultLevel)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Veh_Spd))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Fuel_Signal)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Engine_Speed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Engine_Speed)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'TCM_GearFd)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Steer_fd)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Steer_fd)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'Steer_fd)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'Steer_fd)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Lat_State)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <cdm_cmd>) istream)
  "Deserializes a message object of type '<cdm_cmd>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Veh_Mass)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Front_Hydraulic_BrakeFd)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Rear_Hydraulic_BrakeFd)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'DriveModeFd)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Load_BrakeFd)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Compartment_Fd)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Vehicle_FaultLevel)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Veh_Spd) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Fuel_Signal)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Engine_Speed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Engine_Speed)) (cl:read-byte istream))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'TCM_GearFd) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Steer_fd)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Steer_fd)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'Steer_fd)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'Steer_fd)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Lat_State)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<cdm_cmd>)))
  "Returns string type for a message object of type '<cdm_cmd>"
  "vehicle_msgs/cdm_cmd")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cdm_cmd)))
  "Returns string type for a message object of type 'cdm_cmd"
  "vehicle_msgs/cdm_cmd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<cdm_cmd>)))
  "Returns md5sum for a message object of type '<cdm_cmd>"
  "7b69952894d338c32418394971da76f8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'cdm_cmd)))
  "Returns md5sum for a message object of type 'cdm_cmd"
  "7b69952894d338c32418394971da76f8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<cdm_cmd>)))
  "Returns full string definition for message of type '<cdm_cmd>"
  (cl:format cl:nil "uint8 Veh_Mass~%uint8 Front_Hydraulic_BrakeFd~%uint8 Rear_Hydraulic_BrakeFd~%uint8 DriveModeFd~%uint8 Load_BrakeFd~%#uint8 Compartment_Up~%#uint8 Compartment_Down~%#uint8 Compartment_UpHighest~%#uint8 Compartment_UpLowest~%uint8 Compartment_Fd~%uint8 Vehicle_FaultLevel~%float32 Veh_Spd~%uint8 Fuel_Signal~%uint16 Engine_Speed~%int8 TCM_GearFd~%uint32 Steer_fd~%uint8 Lat_State~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'cdm_cmd)))
  "Returns full string definition for message of type 'cdm_cmd"
  (cl:format cl:nil "uint8 Veh_Mass~%uint8 Front_Hydraulic_BrakeFd~%uint8 Rear_Hydraulic_BrakeFd~%uint8 DriveModeFd~%uint8 Load_BrakeFd~%#uint8 Compartment_Up~%#uint8 Compartment_Down~%#uint8 Compartment_UpHighest~%#uint8 Compartment_UpLowest~%uint8 Compartment_Fd~%uint8 Vehicle_FaultLevel~%float32 Veh_Spd~%uint8 Fuel_Signal~%uint16 Engine_Speed~%int8 TCM_GearFd~%uint32 Steer_fd~%uint8 Lat_State~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <cdm_cmd>))
  (cl:+ 0
     1
     1
     1
     1
     1
     1
     1
     4
     1
     2
     1
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <cdm_cmd>))
  "Converts a ROS message object to a list"
  (cl:list 'cdm_cmd
    (cl:cons ':Veh_Mass (Veh_Mass msg))
    (cl:cons ':Front_Hydraulic_BrakeFd (Front_Hydraulic_BrakeFd msg))
    (cl:cons ':Rear_Hydraulic_BrakeFd (Rear_Hydraulic_BrakeFd msg))
    (cl:cons ':DriveModeFd (DriveModeFd msg))
    (cl:cons ':Load_BrakeFd (Load_BrakeFd msg))
    (cl:cons ':Compartment_Fd (Compartment_Fd msg))
    (cl:cons ':Vehicle_FaultLevel (Vehicle_FaultLevel msg))
    (cl:cons ':Veh_Spd (Veh_Spd msg))
    (cl:cons ':Fuel_Signal (Fuel_Signal msg))
    (cl:cons ':Engine_Speed (Engine_Speed msg))
    (cl:cons ':TCM_GearFd (TCM_GearFd msg))
    (cl:cons ':Steer_fd (Steer_fd msg))
    (cl:cons ':Lat_State (Lat_State msg))
))
