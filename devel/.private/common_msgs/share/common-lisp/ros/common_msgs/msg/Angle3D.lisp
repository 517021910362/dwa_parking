; Auto-generated. Do not edit!


(cl:in-package common_msgs-msg)


;//! \htmlinclude Angle3D.msg.html

(cl:defclass <Angle3D> (roslisp-msg-protocol:ros-message)
  ((heading
    :reader heading
    :initarg :heading
    :type cl:float
    :initform 0.0)
   (pitch
    :reader pitch
    :initarg :pitch
    :type cl:float
    :initform 0.0)
   (roll
    :reader roll
    :initarg :roll
    :type cl:float
    :initform 0.0))
)

(cl:defclass Angle3D (<Angle3D>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Angle3D>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Angle3D)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common_msgs-msg:<Angle3D> is deprecated: use common_msgs-msg:Angle3D instead.")))

(cl:ensure-generic-function 'heading-val :lambda-list '(m))
(cl:defmethod heading-val ((m <Angle3D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs-msg:heading-val is deprecated.  Use common_msgs-msg:heading instead.")
  (heading m))

(cl:ensure-generic-function 'pitch-val :lambda-list '(m))
(cl:defmethod pitch-val ((m <Angle3D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs-msg:pitch-val is deprecated.  Use common_msgs-msg:pitch instead.")
  (pitch m))

(cl:ensure-generic-function 'roll-val :lambda-list '(m))
(cl:defmethod roll-val ((m <Angle3D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs-msg:roll-val is deprecated.  Use common_msgs-msg:roll instead.")
  (roll m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Angle3D>) ostream)
  "Serializes a message object of type '<Angle3D>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'heading))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pitch))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'roll))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Angle3D>) istream)
  "Deserializes a message object of type '<Angle3D>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'heading) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pitch) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'roll) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Angle3D>)))
  "Returns string type for a message object of type '<Angle3D>"
  "common_msgs/Angle3D")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Angle3D)))
  "Returns string type for a message object of type 'Angle3D"
  "common_msgs/Angle3D")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Angle3D>)))
  "Returns md5sum for a message object of type '<Angle3D>"
  "a0a24f94640b168577ac5c59871cb550")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Angle3D)))
  "Returns md5sum for a message object of type 'Angle3D"
  "a0a24f94640b168577ac5c59871cb550")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Angle3D>)))
  "Returns full string definition for message of type '<Angle3D>"
  (cl:format cl:nil "float32 heading   # 航向角~%float32 pitch   # 俯仰角~%float32 roll # 横滚角~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Angle3D)))
  "Returns full string definition for message of type 'Angle3D"
  (cl:format cl:nil "float32 heading   # 航向角~%float32 pitch   # 俯仰角~%float32 roll # 横滚角~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Angle3D>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Angle3D>))
  "Converts a ROS message object to a list"
  (cl:list 'Angle3D
    (cl:cons ':heading (heading msg))
    (cl:cons ':pitch (pitch msg))
    (cl:cons ':roll (roll msg))
))
