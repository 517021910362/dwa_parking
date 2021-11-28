; Auto-generated. Do not edit!


(cl:in-package common_msgs-msg)


;//! \htmlinclude Range3D.msg.html

(cl:defclass <Range3D> (roslisp-msg-protocol:ros-message)
  ((xMax
    :reader xMax
    :initarg :xMax
    :type cl:float
    :initform 0.0)
   (xMin
    :reader xMin
    :initarg :xMin
    :type cl:float
    :initform 0.0)
   (yMax
    :reader yMax
    :initarg :yMax
    :type cl:float
    :initform 0.0)
   (yMin
    :reader yMin
    :initarg :yMin
    :type cl:float
    :initform 0.0)
   (zMax
    :reader zMax
    :initarg :zMax
    :type cl:float
    :initform 0.0)
   (zMin
    :reader zMin
    :initarg :zMin
    :type cl:float
    :initform 0.0))
)

(cl:defclass Range3D (<Range3D>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Range3D>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Range3D)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common_msgs-msg:<Range3D> is deprecated: use common_msgs-msg:Range3D instead.")))

(cl:ensure-generic-function 'xMax-val :lambda-list '(m))
(cl:defmethod xMax-val ((m <Range3D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs-msg:xMax-val is deprecated.  Use common_msgs-msg:xMax instead.")
  (xMax m))

(cl:ensure-generic-function 'xMin-val :lambda-list '(m))
(cl:defmethod xMin-val ((m <Range3D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs-msg:xMin-val is deprecated.  Use common_msgs-msg:xMin instead.")
  (xMin m))

(cl:ensure-generic-function 'yMax-val :lambda-list '(m))
(cl:defmethod yMax-val ((m <Range3D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs-msg:yMax-val is deprecated.  Use common_msgs-msg:yMax instead.")
  (yMax m))

(cl:ensure-generic-function 'yMin-val :lambda-list '(m))
(cl:defmethod yMin-val ((m <Range3D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs-msg:yMin-val is deprecated.  Use common_msgs-msg:yMin instead.")
  (yMin m))

(cl:ensure-generic-function 'zMax-val :lambda-list '(m))
(cl:defmethod zMax-val ((m <Range3D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs-msg:zMax-val is deprecated.  Use common_msgs-msg:zMax instead.")
  (zMax m))

(cl:ensure-generic-function 'zMin-val :lambda-list '(m))
(cl:defmethod zMin-val ((m <Range3D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs-msg:zMin-val is deprecated.  Use common_msgs-msg:zMin instead.")
  (zMin m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Range3D>) ostream)
  "Serializes a message object of type '<Range3D>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'xMax))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'xMin))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yMax))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yMin))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'zMax))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'zMin))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Range3D>) istream)
  "Deserializes a message object of type '<Range3D>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'xMax) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'xMin) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yMax) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yMin) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'zMax) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'zMin) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Range3D>)))
  "Returns string type for a message object of type '<Range3D>"
  "common_msgs/Range3D")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Range3D)))
  "Returns string type for a message object of type 'Range3D"
  "common_msgs/Range3D")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Range3D>)))
  "Returns md5sum for a message object of type '<Range3D>"
  "440fcab4969f9ce8d62e2fe8adcf659a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Range3D)))
  "Returns md5sum for a message object of type 'Range3D"
  "440fcab4969f9ce8d62e2fe8adcf659a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Range3D>)))
  "Returns full string definition for message of type '<Range3D>"
  (cl:format cl:nil "float32 xMax~%float32 xMin~%float32 yMax~%float32 yMin~%float32 zMax~%float32 zMin~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Range3D)))
  "Returns full string definition for message of type 'Range3D"
  (cl:format cl:nil "float32 xMax~%float32 xMin~%float32 yMax~%float32 yMin~%float32 zMax~%float32 zMin~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Range3D>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Range3D>))
  "Converts a ROS message object to a list"
  (cl:list 'Range3D
    (cl:cons ':xMax (xMax msg))
    (cl:cons ':xMin (xMin msg))
    (cl:cons ':yMax (yMax msg))
    (cl:cons ':yMin (yMin msg))
    (cl:cons ':zMax (zMax msg))
    (cl:cons ':zMin (zMin msg))
))
