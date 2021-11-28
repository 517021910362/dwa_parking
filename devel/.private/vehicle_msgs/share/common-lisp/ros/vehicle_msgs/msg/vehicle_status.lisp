; Auto-generated. Do not edit!


(cl:in-package vehicle_msgs-msg)


;//! \htmlinclude vehicle_status.msg.html

(cl:defclass <vehicle_status> (roslisp-msg-protocol:ros-message)
  ((head1
    :reader head1
    :initarg :head1
    :type cl:fixnum
    :initform 0)
   (head2
    :reader head2
    :initarg :head2
    :type cl:fixnum
    :initform 0)
   (length
    :reader length
    :initarg :length
    :type cl:fixnum
    :initform 0)
   (steering
    :reader steering
    :initarg :steering
    :type cl:fixnum
    :initform 0)
   (brake_status
    :reader brake_status
    :initarg :brake_status
    :type cl:fixnum
    :initform 0)
   (pedal_ratio
    :reader pedal_ratio
    :initarg :pedal_ratio
    :type cl:fixnum
    :initform 0)
   (gear_position
    :reader gear_position
    :initarg :gear_position
    :type cl:fixnum
    :initform 0)
   (speed_left_front
    :reader speed_left_front
    :initarg :speed_left_front
    :type cl:fixnum
    :initform 0)
   (speed_right_front
    :reader speed_right_front
    :initarg :speed_right_front
    :type cl:fixnum
    :initform 0)
   (speed_left_rear
    :reader speed_left_rear
    :initarg :speed_left_rear
    :type cl:fixnum
    :initform 0)
   (speed_right_rear
    :reader speed_right_rear
    :initarg :speed_right_rear
    :type cl:fixnum
    :initform 0)
   (command
    :reader command
    :initarg :command
    :type cl:fixnum
    :initform 0)
   (work_mode
    :reader work_mode
    :initarg :work_mode
    :type cl:fixnum
    :initform 0)
   (racing_num
    :reader racing_num
    :initarg :racing_num
    :type cl:fixnum
    :initform 0)
   (fault_type
    :reader fault_type
    :initarg :fault_type
    :type cl:fixnum
    :initform 0)
   (checksum
    :reader checksum
    :initarg :checksum
    :type cl:fixnum
    :initform 0))
)

(cl:defclass vehicle_status (<vehicle_status>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <vehicle_status>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'vehicle_status)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name vehicle_msgs-msg:<vehicle_status> is deprecated: use vehicle_msgs-msg:vehicle_status instead.")))

(cl:ensure-generic-function 'head1-val :lambda-list '(m))
(cl:defmethod head1-val ((m <vehicle_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:head1-val is deprecated.  Use vehicle_msgs-msg:head1 instead.")
  (head1 m))

(cl:ensure-generic-function 'head2-val :lambda-list '(m))
(cl:defmethod head2-val ((m <vehicle_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:head2-val is deprecated.  Use vehicle_msgs-msg:head2 instead.")
  (head2 m))

(cl:ensure-generic-function 'length-val :lambda-list '(m))
(cl:defmethod length-val ((m <vehicle_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:length-val is deprecated.  Use vehicle_msgs-msg:length instead.")
  (length m))

(cl:ensure-generic-function 'steering-val :lambda-list '(m))
(cl:defmethod steering-val ((m <vehicle_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:steering-val is deprecated.  Use vehicle_msgs-msg:steering instead.")
  (steering m))

(cl:ensure-generic-function 'brake_status-val :lambda-list '(m))
(cl:defmethod brake_status-val ((m <vehicle_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:brake_status-val is deprecated.  Use vehicle_msgs-msg:brake_status instead.")
  (brake_status m))

(cl:ensure-generic-function 'pedal_ratio-val :lambda-list '(m))
(cl:defmethod pedal_ratio-val ((m <vehicle_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:pedal_ratio-val is deprecated.  Use vehicle_msgs-msg:pedal_ratio instead.")
  (pedal_ratio m))

(cl:ensure-generic-function 'gear_position-val :lambda-list '(m))
(cl:defmethod gear_position-val ((m <vehicle_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:gear_position-val is deprecated.  Use vehicle_msgs-msg:gear_position instead.")
  (gear_position m))

(cl:ensure-generic-function 'speed_left_front-val :lambda-list '(m))
(cl:defmethod speed_left_front-val ((m <vehicle_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:speed_left_front-val is deprecated.  Use vehicle_msgs-msg:speed_left_front instead.")
  (speed_left_front m))

(cl:ensure-generic-function 'speed_right_front-val :lambda-list '(m))
(cl:defmethod speed_right_front-val ((m <vehicle_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:speed_right_front-val is deprecated.  Use vehicle_msgs-msg:speed_right_front instead.")
  (speed_right_front m))

(cl:ensure-generic-function 'speed_left_rear-val :lambda-list '(m))
(cl:defmethod speed_left_rear-val ((m <vehicle_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:speed_left_rear-val is deprecated.  Use vehicle_msgs-msg:speed_left_rear instead.")
  (speed_left_rear m))

(cl:ensure-generic-function 'speed_right_rear-val :lambda-list '(m))
(cl:defmethod speed_right_rear-val ((m <vehicle_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:speed_right_rear-val is deprecated.  Use vehicle_msgs-msg:speed_right_rear instead.")
  (speed_right_rear m))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <vehicle_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:command-val is deprecated.  Use vehicle_msgs-msg:command instead.")
  (command m))

(cl:ensure-generic-function 'work_mode-val :lambda-list '(m))
(cl:defmethod work_mode-val ((m <vehicle_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:work_mode-val is deprecated.  Use vehicle_msgs-msg:work_mode instead.")
  (work_mode m))

(cl:ensure-generic-function 'racing_num-val :lambda-list '(m))
(cl:defmethod racing_num-val ((m <vehicle_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:racing_num-val is deprecated.  Use vehicle_msgs-msg:racing_num instead.")
  (racing_num m))

(cl:ensure-generic-function 'fault_type-val :lambda-list '(m))
(cl:defmethod fault_type-val ((m <vehicle_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:fault_type-val is deprecated.  Use vehicle_msgs-msg:fault_type instead.")
  (fault_type m))

(cl:ensure-generic-function 'checksum-val :lambda-list '(m))
(cl:defmethod checksum-val ((m <vehicle_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:checksum-val is deprecated.  Use vehicle_msgs-msg:checksum instead.")
  (checksum m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <vehicle_status>) ostream)
  "Serializes a message object of type '<vehicle_status>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'head1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'head2)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'length)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'steering)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'brake_status)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'pedal_ratio)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'gear_position)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'speed_left_front)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'speed_left_front)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'speed_right_front)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'speed_right_front)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'speed_left_rear)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'speed_left_rear)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'speed_right_rear)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'speed_right_rear)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'command)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'work_mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'racing_num)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'fault_type)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'checksum)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'checksum)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <vehicle_status>) istream)
  "Deserializes a message object of type '<vehicle_status>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'head1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'head2)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'length)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'steering)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'brake_status)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'pedal_ratio)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'gear_position)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'speed_left_front)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'speed_left_front)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'speed_right_front)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'speed_right_front)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'speed_left_rear)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'speed_left_rear)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'speed_right_rear)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'speed_right_rear)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'command)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'work_mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'racing_num)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'fault_type)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'checksum)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'checksum)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<vehicle_status>)))
  "Returns string type for a message object of type '<vehicle_status>"
  "vehicle_msgs/vehicle_status")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'vehicle_status)))
  "Returns string type for a message object of type 'vehicle_status"
  "vehicle_msgs/vehicle_status")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<vehicle_status>)))
  "Returns md5sum for a message object of type '<vehicle_status>"
  "846750d88d04873a7a68c897999f240c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'vehicle_status)))
  "Returns md5sum for a message object of type 'vehicle_status"
  "846750d88d04873a7a68c897999f240c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<vehicle_status>)))
  "Returns full string definition for message of type '<vehicle_status>"
  (cl:format cl:nil "uint8 head1~%uint8 head2~%uint8 length~%uint8 steering~%uint8 brake_status~%uint8 pedal_ratio~%uint8 gear_position~%uint16 speed_left_front~%uint16 speed_right_front~%uint16 speed_left_rear~%uint16 speed_right_rear~%uint8 command~%uint8 work_mode~%uint8 racing_num~%uint8 fault_type~%uint16 checksum~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'vehicle_status)))
  "Returns full string definition for message of type 'vehicle_status"
  (cl:format cl:nil "uint8 head1~%uint8 head2~%uint8 length~%uint8 steering~%uint8 brake_status~%uint8 pedal_ratio~%uint8 gear_position~%uint16 speed_left_front~%uint16 speed_right_front~%uint16 speed_left_rear~%uint16 speed_right_rear~%uint8 command~%uint8 work_mode~%uint8 racing_num~%uint8 fault_type~%uint16 checksum~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <vehicle_status>))
  (cl:+ 0
     1
     1
     1
     1
     1
     1
     1
     2
     2
     2
     2
     1
     1
     1
     1
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <vehicle_status>))
  "Converts a ROS message object to a list"
  (cl:list 'vehicle_status
    (cl:cons ':head1 (head1 msg))
    (cl:cons ':head2 (head2 msg))
    (cl:cons ':length (length msg))
    (cl:cons ':steering (steering msg))
    (cl:cons ':brake_status (brake_status msg))
    (cl:cons ':pedal_ratio (pedal_ratio msg))
    (cl:cons ':gear_position (gear_position msg))
    (cl:cons ':speed_left_front (speed_left_front msg))
    (cl:cons ':speed_right_front (speed_right_front msg))
    (cl:cons ':speed_left_rear (speed_left_rear msg))
    (cl:cons ':speed_right_rear (speed_right_rear msg))
    (cl:cons ':command (command msg))
    (cl:cons ':work_mode (work_mode msg))
    (cl:cons ':racing_num (racing_num msg))
    (cl:cons ':fault_type (fault_type msg))
    (cl:cons ':checksum (checksum msg))
))
