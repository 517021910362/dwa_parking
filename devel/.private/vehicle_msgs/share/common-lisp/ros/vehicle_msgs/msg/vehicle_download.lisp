; Auto-generated. Do not edit!


(cl:in-package vehicle_msgs-msg)


;//! \htmlinclude vehicle_download.msg.html

(cl:defclass <vehicle_download> (roslisp-msg-protocol:ros-message)
  ((TarAccler
    :reader TarAccler
    :initarg :TarAccler
    :type cl:float
    :initform 0.0)
   (Tar_steerangle
    :reader Tar_steerangle
    :initarg :Tar_steerangle
    :type cl:float
    :initform 0.0)
   (Tar_gear
    :reader Tar_gear
    :initarg :Tar_gear
    :type cl:fixnum
    :initform 0)
   (DiveoffReq
    :reader DiveoffReq
    :initarg :DiveoffReq
    :type cl:fixnum
    :initform 0)
   (ADS_mode
    :reader ADS_mode
    :initarg :ADS_mode
    :type cl:fixnum
    :initform 0)
   (Stoprequest
    :reader Stoprequest
    :initarg :Stoprequest
    :type cl:fixnum
    :initform 0)
   (EndOfTravel
    :reader EndOfTravel
    :initarg :EndOfTravel
    :type cl:fixnum
    :initform 0)
   (Station_In_Out
    :reader Station_In_Out
    :initarg :Station_In_Out
    :type cl:fixnum
    :initform 0)
   (TurnSignal
    :reader TurnSignal
    :initarg :TurnSignal
    :type cl:fixnum
    :initform 0)
   (DoubleLight
    :reader DoubleLight
    :initarg :DoubleLight
    :type cl:fixnum
    :initform 0)
   (HummerSts
    :reader HummerSts
    :initarg :HummerSts
    :type cl:fixnum
    :initform 0)
   (latAcceleration
    :reader latAcceleration
    :initarg :latAcceleration
    :type cl:float
    :initform 0.0)
   (longAcceleration
    :reader longAcceleration
    :initarg :longAcceleration
    :type cl:float
    :initform 0.0)
   (Acceleration
    :reader Acceleration
    :initarg :Acceleration
    :type cl:float
    :initform 0.0)
   (Yaw_rate
    :reader Yaw_rate
    :initarg :Yaw_rate
    :type cl:float
    :initform 0.0)
   (Slope
    :reader Slope
    :initarg :Slope
    :type cl:float
    :initform 0.0))
)

(cl:defclass vehicle_download (<vehicle_download>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <vehicle_download>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'vehicle_download)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name vehicle_msgs-msg:<vehicle_download> is deprecated: use vehicle_msgs-msg:vehicle_download instead.")))

(cl:ensure-generic-function 'TarAccler-val :lambda-list '(m))
(cl:defmethod TarAccler-val ((m <vehicle_download>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:TarAccler-val is deprecated.  Use vehicle_msgs-msg:TarAccler instead.")
  (TarAccler m))

(cl:ensure-generic-function 'Tar_steerangle-val :lambda-list '(m))
(cl:defmethod Tar_steerangle-val ((m <vehicle_download>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Tar_steerangle-val is deprecated.  Use vehicle_msgs-msg:Tar_steerangle instead.")
  (Tar_steerangle m))

(cl:ensure-generic-function 'Tar_gear-val :lambda-list '(m))
(cl:defmethod Tar_gear-val ((m <vehicle_download>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Tar_gear-val is deprecated.  Use vehicle_msgs-msg:Tar_gear instead.")
  (Tar_gear m))

(cl:ensure-generic-function 'DiveoffReq-val :lambda-list '(m))
(cl:defmethod DiveoffReq-val ((m <vehicle_download>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:DiveoffReq-val is deprecated.  Use vehicle_msgs-msg:DiveoffReq instead.")
  (DiveoffReq m))

(cl:ensure-generic-function 'ADS_mode-val :lambda-list '(m))
(cl:defmethod ADS_mode-val ((m <vehicle_download>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:ADS_mode-val is deprecated.  Use vehicle_msgs-msg:ADS_mode instead.")
  (ADS_mode m))

(cl:ensure-generic-function 'Stoprequest-val :lambda-list '(m))
(cl:defmethod Stoprequest-val ((m <vehicle_download>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Stoprequest-val is deprecated.  Use vehicle_msgs-msg:Stoprequest instead.")
  (Stoprequest m))

(cl:ensure-generic-function 'EndOfTravel-val :lambda-list '(m))
(cl:defmethod EndOfTravel-val ((m <vehicle_download>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:EndOfTravel-val is deprecated.  Use vehicle_msgs-msg:EndOfTravel instead.")
  (EndOfTravel m))

(cl:ensure-generic-function 'Station_In_Out-val :lambda-list '(m))
(cl:defmethod Station_In_Out-val ((m <vehicle_download>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Station_In_Out-val is deprecated.  Use vehicle_msgs-msg:Station_In_Out instead.")
  (Station_In_Out m))

(cl:ensure-generic-function 'TurnSignal-val :lambda-list '(m))
(cl:defmethod TurnSignal-val ((m <vehicle_download>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:TurnSignal-val is deprecated.  Use vehicle_msgs-msg:TurnSignal instead.")
  (TurnSignal m))

(cl:ensure-generic-function 'DoubleLight-val :lambda-list '(m))
(cl:defmethod DoubleLight-val ((m <vehicle_download>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:DoubleLight-val is deprecated.  Use vehicle_msgs-msg:DoubleLight instead.")
  (DoubleLight m))

(cl:ensure-generic-function 'HummerSts-val :lambda-list '(m))
(cl:defmethod HummerSts-val ((m <vehicle_download>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:HummerSts-val is deprecated.  Use vehicle_msgs-msg:HummerSts instead.")
  (HummerSts m))

(cl:ensure-generic-function 'latAcceleration-val :lambda-list '(m))
(cl:defmethod latAcceleration-val ((m <vehicle_download>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:latAcceleration-val is deprecated.  Use vehicle_msgs-msg:latAcceleration instead.")
  (latAcceleration m))

(cl:ensure-generic-function 'longAcceleration-val :lambda-list '(m))
(cl:defmethod longAcceleration-val ((m <vehicle_download>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:longAcceleration-val is deprecated.  Use vehicle_msgs-msg:longAcceleration instead.")
  (longAcceleration m))

(cl:ensure-generic-function 'Acceleration-val :lambda-list '(m))
(cl:defmethod Acceleration-val ((m <vehicle_download>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Acceleration-val is deprecated.  Use vehicle_msgs-msg:Acceleration instead.")
  (Acceleration m))

(cl:ensure-generic-function 'Yaw_rate-val :lambda-list '(m))
(cl:defmethod Yaw_rate-val ((m <vehicle_download>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Yaw_rate-val is deprecated.  Use vehicle_msgs-msg:Yaw_rate instead.")
  (Yaw_rate m))

(cl:ensure-generic-function 'Slope-val :lambda-list '(m))
(cl:defmethod Slope-val ((m <vehicle_download>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Slope-val is deprecated.  Use vehicle_msgs-msg:Slope instead.")
  (Slope m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <vehicle_download>) ostream)
  "Serializes a message object of type '<vehicle_download>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'TarAccler))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Tar_steerangle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Tar_gear)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'DiveoffReq)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ADS_mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Stoprequest)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'EndOfTravel)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Station_In_Out)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'TurnSignal)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'DoubleLight)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'HummerSts)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'latAcceleration))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'longAcceleration))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Acceleration))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Yaw_rate))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Slope))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <vehicle_download>) istream)
  "Deserializes a message object of type '<vehicle_download>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'TarAccler) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Tar_steerangle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Tar_gear)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'DiveoffReq)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ADS_mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Stoprequest)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'EndOfTravel)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Station_In_Out)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'TurnSignal)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'DoubleLight)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'HummerSts)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'latAcceleration) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'longAcceleration) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Acceleration) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Yaw_rate) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Slope) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<vehicle_download>)))
  "Returns string type for a message object of type '<vehicle_download>"
  "vehicle_msgs/vehicle_download")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'vehicle_download)))
  "Returns string type for a message object of type 'vehicle_download"
  "vehicle_msgs/vehicle_download")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<vehicle_download>)))
  "Returns md5sum for a message object of type '<vehicle_download>"
  "b1c7accc64c1d758d5af51e3905238ba")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'vehicle_download)))
  "Returns md5sum for a message object of type 'vehicle_download"
  "b1c7accc64c1d758d5af51e3905238ba")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<vehicle_download>)))
  "Returns full string definition for message of type '<vehicle_download>"
  (cl:format cl:nil "float32 TarAccler~%float32 Tar_steerangle~%uint8 Tar_gear~%uint8 DiveoffReq~%uint8 ADS_mode~%uint8 Stoprequest~%uint8 EndOfTravel~%uint8 Station_In_Out~%uint8 TurnSignal~%uint8 DoubleLight~%uint8 HummerSts~%float32 latAcceleration~%float32 longAcceleration~%float32 Acceleration~%float32 Yaw_rate~%float32 Slope~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'vehicle_download)))
  "Returns full string definition for message of type 'vehicle_download"
  (cl:format cl:nil "float32 TarAccler~%float32 Tar_steerangle~%uint8 Tar_gear~%uint8 DiveoffReq~%uint8 ADS_mode~%uint8 Stoprequest~%uint8 EndOfTravel~%uint8 Station_In_Out~%uint8 TurnSignal~%uint8 DoubleLight~%uint8 HummerSts~%float32 latAcceleration~%float32 longAcceleration~%float32 Acceleration~%float32 Yaw_rate~%float32 Slope~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <vehicle_download>))
  (cl:+ 0
     4
     4
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
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <vehicle_download>))
  "Converts a ROS message object to a list"
  (cl:list 'vehicle_download
    (cl:cons ':TarAccler (TarAccler msg))
    (cl:cons ':Tar_steerangle (Tar_steerangle msg))
    (cl:cons ':Tar_gear (Tar_gear msg))
    (cl:cons ':DiveoffReq (DiveoffReq msg))
    (cl:cons ':ADS_mode (ADS_mode msg))
    (cl:cons ':Stoprequest (Stoprequest msg))
    (cl:cons ':EndOfTravel (EndOfTravel msg))
    (cl:cons ':Station_In_Out (Station_In_Out msg))
    (cl:cons ':TurnSignal (TurnSignal msg))
    (cl:cons ':DoubleLight (DoubleLight msg))
    (cl:cons ':HummerSts (HummerSts msg))
    (cl:cons ':latAcceleration (latAcceleration msg))
    (cl:cons ':longAcceleration (longAcceleration msg))
    (cl:cons ':Acceleration (Acceleration msg))
    (cl:cons ':Yaw_rate (Yaw_rate msg))
    (cl:cons ':Slope (Slope msg))
))
