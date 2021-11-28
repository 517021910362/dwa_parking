; Auto-generated. Do not edit!


(cl:in-package vehicle_msgs-msg)


;//! \htmlinclude adm_cmd.msg.html

(cl:defclass <adm_cmd> (roslisp-msg-protocol:ros-message)
  ((AccPed
    :reader AccPed
    :initarg :AccPed
    :type cl:fixnum
    :initform 0)
   (AccPed_enable
    :reader AccPed_enable
    :initarg :AccPed_enable
    :type cl:fixnum
    :initform 0)
   (ADM_FaultLevel
    :reader ADM_FaultLevel
    :initarg :ADM_FaultLevel
    :type cl:fixnum
    :initform 0)
   (Fog_Light
    :reader Fog_Light
    :initarg :Fog_Light
    :type cl:fixnum
    :initform 0)
   (Horn
    :reader Horn
    :initarg :Horn
    :type cl:fixnum
    :initform 0)
   (Hydraulic_Brake
    :reader Hydraulic_Brake
    :initarg :Hydraulic_Brake
    :type cl:fixnum
    :initform 0)
   (High_BeamLigh
    :reader High_BeamLigh
    :initarg :High_BeamLigh
    :type cl:fixnum
    :initform 0)
   (Low_BeamLight
    :reader Low_BeamLight
    :initarg :Low_BeamLight
    :type cl:fixnum
    :initform 0)
   (Turn_Signal
    :reader Turn_Signal
    :initarg :Turn_Signal
    :type cl:fixnum
    :initform 0)
   (Double_Light
    :reader Double_Light
    :initarg :Double_Light
    :type cl:fixnum
    :initform 0)
   (Night_Light
    :reader Night_Light
    :initarg :Night_Light
    :type cl:fixnum
    :initform 0)
   (Defroster_Control
    :reader Defroster_Control
    :initarg :Defroster_Control
    :type cl:fixnum
    :initform 0)
   (Wiper_Control
    :reader Wiper_Control
    :initarg :Wiper_Control
    :type cl:fixnum
    :initform 0)
   (Amble_Brake
    :reader Amble_Brake
    :initarg :Amble_Brake
    :type cl:fixnum
    :initform 0)
   (Compartment_Control
    :reader Compartment_Control
    :initarg :Compartment_Control
    :type cl:fixnum
    :initform 0)
   (Emergency_Brake
    :reader Emergency_Brake
    :initarg :Emergency_Brake
    :type cl:fixnum
    :initform 0)
   (Load_Brake
    :reader Load_Brake
    :initarg :Load_Brake
    :type cl:fixnum
    :initform 0)
   (Engine_Start
    :reader Engine_Start
    :initarg :Engine_Start
    :type cl:fixnum
    :initform 0)
   (Engine_Stop
    :reader Engine_Stop
    :initarg :Engine_Stop
    :type cl:fixnum
    :initform 0)
   (Road_DryorWet
    :reader Road_DryorWet
    :initarg :Road_DryorWet
    :type cl:fixnum
    :initform 0)
   (Switch_DynamicorEconomical
    :reader Switch_DynamicorEconomical
    :initarg :Switch_DynamicorEconomical
    :type cl:fixnum
    :initform 0)
   (Slope
    :reader Slope
    :initarg :Slope
    :type cl:fixnum
    :initform 0)
   (Gear
    :reader Gear
    :initarg :Gear
    :type cl:fixnum
    :initform 0)
   (GPS1_Curvature_cmd
    :reader GPS1_Curvature_cmd
    :initarg :GPS1_Curvature_cmd
    :type cl:float
    :initform 0.0)
   (finish_over
    :reader finish_over
    :initarg :finish_over
    :type cl:fixnum
    :initform 0))
)

(cl:defclass adm_cmd (<adm_cmd>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <adm_cmd>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'adm_cmd)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name vehicle_msgs-msg:<adm_cmd> is deprecated: use vehicle_msgs-msg:adm_cmd instead.")))

(cl:ensure-generic-function 'AccPed-val :lambda-list '(m))
(cl:defmethod AccPed-val ((m <adm_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:AccPed-val is deprecated.  Use vehicle_msgs-msg:AccPed instead.")
  (AccPed m))

(cl:ensure-generic-function 'AccPed_enable-val :lambda-list '(m))
(cl:defmethod AccPed_enable-val ((m <adm_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:AccPed_enable-val is deprecated.  Use vehicle_msgs-msg:AccPed_enable instead.")
  (AccPed_enable m))

(cl:ensure-generic-function 'ADM_FaultLevel-val :lambda-list '(m))
(cl:defmethod ADM_FaultLevel-val ((m <adm_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:ADM_FaultLevel-val is deprecated.  Use vehicle_msgs-msg:ADM_FaultLevel instead.")
  (ADM_FaultLevel m))

(cl:ensure-generic-function 'Fog_Light-val :lambda-list '(m))
(cl:defmethod Fog_Light-val ((m <adm_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Fog_Light-val is deprecated.  Use vehicle_msgs-msg:Fog_Light instead.")
  (Fog_Light m))

(cl:ensure-generic-function 'Horn-val :lambda-list '(m))
(cl:defmethod Horn-val ((m <adm_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Horn-val is deprecated.  Use vehicle_msgs-msg:Horn instead.")
  (Horn m))

(cl:ensure-generic-function 'Hydraulic_Brake-val :lambda-list '(m))
(cl:defmethod Hydraulic_Brake-val ((m <adm_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Hydraulic_Brake-val is deprecated.  Use vehicle_msgs-msg:Hydraulic_Brake instead.")
  (Hydraulic_Brake m))

(cl:ensure-generic-function 'High_BeamLigh-val :lambda-list '(m))
(cl:defmethod High_BeamLigh-val ((m <adm_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:High_BeamLigh-val is deprecated.  Use vehicle_msgs-msg:High_BeamLigh instead.")
  (High_BeamLigh m))

(cl:ensure-generic-function 'Low_BeamLight-val :lambda-list '(m))
(cl:defmethod Low_BeamLight-val ((m <adm_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Low_BeamLight-val is deprecated.  Use vehicle_msgs-msg:Low_BeamLight instead.")
  (Low_BeamLight m))

(cl:ensure-generic-function 'Turn_Signal-val :lambda-list '(m))
(cl:defmethod Turn_Signal-val ((m <adm_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Turn_Signal-val is deprecated.  Use vehicle_msgs-msg:Turn_Signal instead.")
  (Turn_Signal m))

(cl:ensure-generic-function 'Double_Light-val :lambda-list '(m))
(cl:defmethod Double_Light-val ((m <adm_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Double_Light-val is deprecated.  Use vehicle_msgs-msg:Double_Light instead.")
  (Double_Light m))

(cl:ensure-generic-function 'Night_Light-val :lambda-list '(m))
(cl:defmethod Night_Light-val ((m <adm_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Night_Light-val is deprecated.  Use vehicle_msgs-msg:Night_Light instead.")
  (Night_Light m))

(cl:ensure-generic-function 'Defroster_Control-val :lambda-list '(m))
(cl:defmethod Defroster_Control-val ((m <adm_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Defroster_Control-val is deprecated.  Use vehicle_msgs-msg:Defroster_Control instead.")
  (Defroster_Control m))

(cl:ensure-generic-function 'Wiper_Control-val :lambda-list '(m))
(cl:defmethod Wiper_Control-val ((m <adm_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Wiper_Control-val is deprecated.  Use vehicle_msgs-msg:Wiper_Control instead.")
  (Wiper_Control m))

(cl:ensure-generic-function 'Amble_Brake-val :lambda-list '(m))
(cl:defmethod Amble_Brake-val ((m <adm_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Amble_Brake-val is deprecated.  Use vehicle_msgs-msg:Amble_Brake instead.")
  (Amble_Brake m))

(cl:ensure-generic-function 'Compartment_Control-val :lambda-list '(m))
(cl:defmethod Compartment_Control-val ((m <adm_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Compartment_Control-val is deprecated.  Use vehicle_msgs-msg:Compartment_Control instead.")
  (Compartment_Control m))

(cl:ensure-generic-function 'Emergency_Brake-val :lambda-list '(m))
(cl:defmethod Emergency_Brake-val ((m <adm_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Emergency_Brake-val is deprecated.  Use vehicle_msgs-msg:Emergency_Brake instead.")
  (Emergency_Brake m))

(cl:ensure-generic-function 'Load_Brake-val :lambda-list '(m))
(cl:defmethod Load_Brake-val ((m <adm_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Load_Brake-val is deprecated.  Use vehicle_msgs-msg:Load_Brake instead.")
  (Load_Brake m))

(cl:ensure-generic-function 'Engine_Start-val :lambda-list '(m))
(cl:defmethod Engine_Start-val ((m <adm_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Engine_Start-val is deprecated.  Use vehicle_msgs-msg:Engine_Start instead.")
  (Engine_Start m))

(cl:ensure-generic-function 'Engine_Stop-val :lambda-list '(m))
(cl:defmethod Engine_Stop-val ((m <adm_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Engine_Stop-val is deprecated.  Use vehicle_msgs-msg:Engine_Stop instead.")
  (Engine_Stop m))

(cl:ensure-generic-function 'Road_DryorWet-val :lambda-list '(m))
(cl:defmethod Road_DryorWet-val ((m <adm_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Road_DryorWet-val is deprecated.  Use vehicle_msgs-msg:Road_DryorWet instead.")
  (Road_DryorWet m))

(cl:ensure-generic-function 'Switch_DynamicorEconomical-val :lambda-list '(m))
(cl:defmethod Switch_DynamicorEconomical-val ((m <adm_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Switch_DynamicorEconomical-val is deprecated.  Use vehicle_msgs-msg:Switch_DynamicorEconomical instead.")
  (Switch_DynamicorEconomical m))

(cl:ensure-generic-function 'Slope-val :lambda-list '(m))
(cl:defmethod Slope-val ((m <adm_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Slope-val is deprecated.  Use vehicle_msgs-msg:Slope instead.")
  (Slope m))

(cl:ensure-generic-function 'Gear-val :lambda-list '(m))
(cl:defmethod Gear-val ((m <adm_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Gear-val is deprecated.  Use vehicle_msgs-msg:Gear instead.")
  (Gear m))

(cl:ensure-generic-function 'GPS1_Curvature_cmd-val :lambda-list '(m))
(cl:defmethod GPS1_Curvature_cmd-val ((m <adm_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:GPS1_Curvature_cmd-val is deprecated.  Use vehicle_msgs-msg:GPS1_Curvature_cmd instead.")
  (GPS1_Curvature_cmd m))

(cl:ensure-generic-function 'finish_over-val :lambda-list '(m))
(cl:defmethod finish_over-val ((m <adm_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:finish_over-val is deprecated.  Use vehicle_msgs-msg:finish_over instead.")
  (finish_over m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <adm_cmd>) ostream)
  "Serializes a message object of type '<adm_cmd>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'AccPed)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'AccPed_enable)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ADM_FaultLevel)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Fog_Light)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Horn)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Hydraulic_Brake)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'High_BeamLigh)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Low_BeamLight)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Turn_Signal)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Double_Light)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Night_Light)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Defroster_Control)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Wiper_Control)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Amble_Brake)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Compartment_Control)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Emergency_Brake)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Load_Brake)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Engine_Start)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Engine_Stop)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Road_DryorWet)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Switch_DynamicorEconomical)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Slope)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Gear)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'GPS1_Curvature_cmd))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'finish_over)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <adm_cmd>) istream)
  "Deserializes a message object of type '<adm_cmd>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'AccPed)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'AccPed_enable)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ADM_FaultLevel)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Fog_Light)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Horn)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Hydraulic_Brake)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'High_BeamLigh)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Low_BeamLight)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Turn_Signal)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Double_Light)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Night_Light)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Defroster_Control)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Wiper_Control)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Amble_Brake)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Compartment_Control)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Emergency_Brake)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Load_Brake)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Engine_Start)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Engine_Stop)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Road_DryorWet)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Switch_DynamicorEconomical)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Slope)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Gear)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'GPS1_Curvature_cmd) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'finish_over)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<adm_cmd>)))
  "Returns string type for a message object of type '<adm_cmd>"
  "vehicle_msgs/adm_cmd")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'adm_cmd)))
  "Returns string type for a message object of type 'adm_cmd"
  "vehicle_msgs/adm_cmd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<adm_cmd>)))
  "Returns md5sum for a message object of type '<adm_cmd>"
  "03c23fc13499203340068a71426d1dfc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'adm_cmd)))
  "Returns md5sum for a message object of type 'adm_cmd"
  "03c23fc13499203340068a71426d1dfc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<adm_cmd>)))
  "Returns full string definition for message of type '<adm_cmd>"
  (cl:format cl:nil "uint8 AccPed~%uint8 AccPed_enable~%uint8 ADM_FaultLevel~%uint8 Fog_Light~%uint8 Horn~%uint8 Hydraulic_Brake~%uint8 High_BeamLigh~%uint8 Low_BeamLight~%uint8 Turn_Signal~%uint8 Double_Light~%~%uint8 Night_Light~%uint8 Defroster_Control~%uint8 Wiper_Control~%uint8 Amble_Brake~%uint8 Compartment_Control~%uint8 Emergency_Brake~%uint8 Load_Brake~%uint8 Engine_Start~%uint8 Engine_Stop~%uint8 Road_DryorWet~%uint8 Switch_DynamicorEconomical~%uint8 Slope~%uint8 Gear~%float32 GPS1_Curvature_cmd~%uint8 finish_over~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'adm_cmd)))
  "Returns full string definition for message of type 'adm_cmd"
  (cl:format cl:nil "uint8 AccPed~%uint8 AccPed_enable~%uint8 ADM_FaultLevel~%uint8 Fog_Light~%uint8 Horn~%uint8 Hydraulic_Brake~%uint8 High_BeamLigh~%uint8 Low_BeamLight~%uint8 Turn_Signal~%uint8 Double_Light~%~%uint8 Night_Light~%uint8 Defroster_Control~%uint8 Wiper_Control~%uint8 Amble_Brake~%uint8 Compartment_Control~%uint8 Emergency_Brake~%uint8 Load_Brake~%uint8 Engine_Start~%uint8 Engine_Stop~%uint8 Road_DryorWet~%uint8 Switch_DynamicorEconomical~%uint8 Slope~%uint8 Gear~%float32 GPS1_Curvature_cmd~%uint8 finish_over~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <adm_cmd>))
  (cl:+ 0
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <adm_cmd>))
  "Converts a ROS message object to a list"
  (cl:list 'adm_cmd
    (cl:cons ':AccPed (AccPed msg))
    (cl:cons ':AccPed_enable (AccPed_enable msg))
    (cl:cons ':ADM_FaultLevel (ADM_FaultLevel msg))
    (cl:cons ':Fog_Light (Fog_Light msg))
    (cl:cons ':Horn (Horn msg))
    (cl:cons ':Hydraulic_Brake (Hydraulic_Brake msg))
    (cl:cons ':High_BeamLigh (High_BeamLigh msg))
    (cl:cons ':Low_BeamLight (Low_BeamLight msg))
    (cl:cons ':Turn_Signal (Turn_Signal msg))
    (cl:cons ':Double_Light (Double_Light msg))
    (cl:cons ':Night_Light (Night_Light msg))
    (cl:cons ':Defroster_Control (Defroster_Control msg))
    (cl:cons ':Wiper_Control (Wiper_Control msg))
    (cl:cons ':Amble_Brake (Amble_Brake msg))
    (cl:cons ':Compartment_Control (Compartment_Control msg))
    (cl:cons ':Emergency_Brake (Emergency_Brake msg))
    (cl:cons ':Load_Brake (Load_Brake msg))
    (cl:cons ':Engine_Start (Engine_Start msg))
    (cl:cons ':Engine_Stop (Engine_Stop msg))
    (cl:cons ':Road_DryorWet (Road_DryorWet msg))
    (cl:cons ':Switch_DynamicorEconomical (Switch_DynamicorEconomical msg))
    (cl:cons ':Slope (Slope msg))
    (cl:cons ':Gear (Gear msg))
    (cl:cons ':GPS1_Curvature_cmd (GPS1_Curvature_cmd msg))
    (cl:cons ':finish_over (finish_over msg))
))
