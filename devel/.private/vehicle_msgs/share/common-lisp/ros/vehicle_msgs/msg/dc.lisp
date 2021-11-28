; Auto-generated. Do not edit!


(cl:in-package vehicle_msgs-msg)


;//! \htmlinclude dc.msg.html

(cl:defclass <dc> (roslisp-msg-protocol:ros-message)
  ((DC_command
    :reader DC_command
    :initarg :DC_command
    :type cl:fixnum
    :initform 0)
   (DC_entranceRequest
    :reader DC_entranceRequest
    :initarg :DC_entranceRequest
    :type cl:fixnum
    :initform 0)
   (DC_parkingRequest
    :reader DC_parkingRequest
    :initarg :DC_parkingRequest
    :type cl:fixnum
    :initform 0)
   (Excavator_AngleRoll
    :reader Excavator_AngleRoll
    :initarg :Excavator_AngleRoll
    :type cl:float
    :initform 0.0)
   (Excavator_Anglepitch
    :reader Excavator_Anglepitch
    :initarg :Excavator_Anglepitch
    :type cl:float
    :initform 0.0)
   (Excavator_AngleHeading
    :reader Excavator_AngleHeading
    :initarg :Excavator_AngleHeading
    :type cl:float
    :initform 0.0)
   (Excavator_PosLon
    :reader Excavator_PosLon
    :initarg :Excavator_PosLon
    :type cl:float
    :initform 0.0)
   (Excavator_PosLat
    :reader Excavator_PosLat
    :initarg :Excavator_PosLat
    :type cl:float
    :initform 0.0)
   (DC_truckFinish
    :reader DC_truckFinish
    :initarg :DC_truckFinish
    :type cl:fixnum
    :initform 0)
   (MQTT_GateStatus
    :reader MQTT_GateStatus
    :initarg :MQTT_GateStatus
    :type cl:fixnum
    :initform 0)
   (Excavator_ImuStatus
    :reader Excavator_ImuStatus
    :initarg :Excavator_ImuStatus
    :type cl:fixnum
    :initform 0)
   (DC_VehControlReq
    :reader DC_VehControlReq
    :initarg :DC_VehControlReq
    :type cl:fixnum
    :initform 0)
   (DC_DispatchReq
    :reader DC_DispatchReq
    :initarg :DC_DispatchReq
    :type cl:fixnum
    :initform 0)
   (road_List
    :reader road_List
    :initarg :road_List
    :type cl:string
    :initform ""))
)

(cl:defclass dc (<dc>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <dc>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'dc)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name vehicle_msgs-msg:<dc> is deprecated: use vehicle_msgs-msg:dc instead.")))

(cl:ensure-generic-function 'DC_command-val :lambda-list '(m))
(cl:defmethod DC_command-val ((m <dc>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:DC_command-val is deprecated.  Use vehicle_msgs-msg:DC_command instead.")
  (DC_command m))

(cl:ensure-generic-function 'DC_entranceRequest-val :lambda-list '(m))
(cl:defmethod DC_entranceRequest-val ((m <dc>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:DC_entranceRequest-val is deprecated.  Use vehicle_msgs-msg:DC_entranceRequest instead.")
  (DC_entranceRequest m))

(cl:ensure-generic-function 'DC_parkingRequest-val :lambda-list '(m))
(cl:defmethod DC_parkingRequest-val ((m <dc>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:DC_parkingRequest-val is deprecated.  Use vehicle_msgs-msg:DC_parkingRequest instead.")
  (DC_parkingRequest m))

(cl:ensure-generic-function 'Excavator_AngleRoll-val :lambda-list '(m))
(cl:defmethod Excavator_AngleRoll-val ((m <dc>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Excavator_AngleRoll-val is deprecated.  Use vehicle_msgs-msg:Excavator_AngleRoll instead.")
  (Excavator_AngleRoll m))

(cl:ensure-generic-function 'Excavator_Anglepitch-val :lambda-list '(m))
(cl:defmethod Excavator_Anglepitch-val ((m <dc>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Excavator_Anglepitch-val is deprecated.  Use vehicle_msgs-msg:Excavator_Anglepitch instead.")
  (Excavator_Anglepitch m))

(cl:ensure-generic-function 'Excavator_AngleHeading-val :lambda-list '(m))
(cl:defmethod Excavator_AngleHeading-val ((m <dc>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Excavator_AngleHeading-val is deprecated.  Use vehicle_msgs-msg:Excavator_AngleHeading instead.")
  (Excavator_AngleHeading m))

(cl:ensure-generic-function 'Excavator_PosLon-val :lambda-list '(m))
(cl:defmethod Excavator_PosLon-val ((m <dc>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Excavator_PosLon-val is deprecated.  Use vehicle_msgs-msg:Excavator_PosLon instead.")
  (Excavator_PosLon m))

(cl:ensure-generic-function 'Excavator_PosLat-val :lambda-list '(m))
(cl:defmethod Excavator_PosLat-val ((m <dc>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Excavator_PosLat-val is deprecated.  Use vehicle_msgs-msg:Excavator_PosLat instead.")
  (Excavator_PosLat m))

(cl:ensure-generic-function 'DC_truckFinish-val :lambda-list '(m))
(cl:defmethod DC_truckFinish-val ((m <dc>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:DC_truckFinish-val is deprecated.  Use vehicle_msgs-msg:DC_truckFinish instead.")
  (DC_truckFinish m))

(cl:ensure-generic-function 'MQTT_GateStatus-val :lambda-list '(m))
(cl:defmethod MQTT_GateStatus-val ((m <dc>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:MQTT_GateStatus-val is deprecated.  Use vehicle_msgs-msg:MQTT_GateStatus instead.")
  (MQTT_GateStatus m))

(cl:ensure-generic-function 'Excavator_ImuStatus-val :lambda-list '(m))
(cl:defmethod Excavator_ImuStatus-val ((m <dc>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Excavator_ImuStatus-val is deprecated.  Use vehicle_msgs-msg:Excavator_ImuStatus instead.")
  (Excavator_ImuStatus m))

(cl:ensure-generic-function 'DC_VehControlReq-val :lambda-list '(m))
(cl:defmethod DC_VehControlReq-val ((m <dc>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:DC_VehControlReq-val is deprecated.  Use vehicle_msgs-msg:DC_VehControlReq instead.")
  (DC_VehControlReq m))

(cl:ensure-generic-function 'DC_DispatchReq-val :lambda-list '(m))
(cl:defmethod DC_DispatchReq-val ((m <dc>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:DC_DispatchReq-val is deprecated.  Use vehicle_msgs-msg:DC_DispatchReq instead.")
  (DC_DispatchReq m))

(cl:ensure-generic-function 'road_List-val :lambda-list '(m))
(cl:defmethod road_List-val ((m <dc>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:road_List-val is deprecated.  Use vehicle_msgs-msg:road_List instead.")
  (road_List m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <dc>) ostream)
  "Serializes a message object of type '<dc>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'DC_command)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'DC_entranceRequest)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'DC_parkingRequest)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Excavator_AngleRoll))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Excavator_Anglepitch))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Excavator_AngleHeading))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Excavator_PosLon))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Excavator_PosLat))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'DC_truckFinish)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'MQTT_GateStatus)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Excavator_ImuStatus)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'DC_VehControlReq)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'DC_DispatchReq)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'road_List))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'road_List))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <dc>) istream)
  "Deserializes a message object of type '<dc>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'DC_command)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'DC_entranceRequest)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'DC_parkingRequest)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Excavator_AngleRoll) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Excavator_Anglepitch) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Excavator_AngleHeading) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Excavator_PosLon) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Excavator_PosLat) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'DC_truckFinish)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'MQTT_GateStatus)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Excavator_ImuStatus)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'DC_VehControlReq)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'DC_DispatchReq)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'road_List) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'road_List) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<dc>)))
  "Returns string type for a message object of type '<dc>"
  "vehicle_msgs/dc")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'dc)))
  "Returns string type for a message object of type 'dc"
  "vehicle_msgs/dc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<dc>)))
  "Returns md5sum for a message object of type '<dc>"
  "ea6e5c96799e7b32503d5842a24d9a14")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'dc)))
  "Returns md5sum for a message object of type 'dc"
  "ea6e5c96799e7b32503d5842a24d9a14")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<dc>)))
  "Returns full string definition for message of type '<dc>"
  (cl:format cl:nil "uint8 DC_command~%uint8 DC_entranceRequest~%uint8 DC_parkingRequest~%float32 Excavator_AngleRoll~%float32 Excavator_Anglepitch~%float32 Excavator_AngleHeading~%float32 Excavator_PosLon~%float32 Excavator_PosLat~%uint8 DC_truckFinish~%uint8 MQTT_GateStatus~%uint8 Excavator_ImuStatus~%uint8 DC_VehControlReq~%uint8 DC_DispatchReq~%string road_List~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'dc)))
  "Returns full string definition for message of type 'dc"
  (cl:format cl:nil "uint8 DC_command~%uint8 DC_entranceRequest~%uint8 DC_parkingRequest~%float32 Excavator_AngleRoll~%float32 Excavator_Anglepitch~%float32 Excavator_AngleHeading~%float32 Excavator_PosLon~%float32 Excavator_PosLat~%uint8 DC_truckFinish~%uint8 MQTT_GateStatus~%uint8 Excavator_ImuStatus~%uint8 DC_VehControlReq~%uint8 DC_DispatchReq~%string road_List~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <dc>))
  (cl:+ 0
     1
     1
     1
     4
     4
     4
     4
     4
     1
     1
     1
     1
     1
     4 (cl:length (cl:slot-value msg 'road_List))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <dc>))
  "Converts a ROS message object to a list"
  (cl:list 'dc
    (cl:cons ':DC_command (DC_command msg))
    (cl:cons ':DC_entranceRequest (DC_entranceRequest msg))
    (cl:cons ':DC_parkingRequest (DC_parkingRequest msg))
    (cl:cons ':Excavator_AngleRoll (Excavator_AngleRoll msg))
    (cl:cons ':Excavator_Anglepitch (Excavator_Anglepitch msg))
    (cl:cons ':Excavator_AngleHeading (Excavator_AngleHeading msg))
    (cl:cons ':Excavator_PosLon (Excavator_PosLon msg))
    (cl:cons ':Excavator_PosLat (Excavator_PosLat msg))
    (cl:cons ':DC_truckFinish (DC_truckFinish msg))
    (cl:cons ':MQTT_GateStatus (MQTT_GateStatus msg))
    (cl:cons ':Excavator_ImuStatus (Excavator_ImuStatus msg))
    (cl:cons ':DC_VehControlReq (DC_VehControlReq msg))
    (cl:cons ':DC_DispatchReq (DC_DispatchReq msg))
    (cl:cons ':road_List (road_List msg))
))
