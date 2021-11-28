;; Auto-generated. Do not edit!


(when (boundp 'common_msgs::Angle3D)
  (if (not (find-package "COMMON_MSGS"))
    (make-package "COMMON_MSGS"))
  (shadow 'Angle3D (find-package "COMMON_MSGS")))
(unless (find-package "COMMON_MSGS::ANGLE3D")
  (make-package "COMMON_MSGS::ANGLE3D"))

(in-package "ROS")
;;//! \htmlinclude Angle3D.msg.html


(defclass common_msgs::Angle3D
  :super ros::object
  :slots (_heading _pitch _roll ))

(defmethod common_msgs::Angle3D
  (:init
   (&key
    ((:heading __heading) 0.0)
    ((:pitch __pitch) 0.0)
    ((:roll __roll) 0.0)
    )
   (send-super :init)
   (setq _heading (float __heading))
   (setq _pitch (float __pitch))
   (setq _roll (float __roll))
   self)
  (:heading
   (&optional __heading)
   (if __heading (setq _heading __heading)) _heading)
  (:pitch
   (&optional __pitch)
   (if __pitch (setq _pitch __pitch)) _pitch)
  (:roll
   (&optional __roll)
   (if __roll (setq _roll __roll)) _roll)
  (:serialization-length
   ()
   (+
    ;; float32 _heading
    4
    ;; float32 _pitch
    4
    ;; float32 _roll
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _heading
       (sys::poke _heading (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _pitch
       (sys::poke _pitch (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _roll
       (sys::poke _roll (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _heading
     (setq _heading (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pitch
     (setq _pitch (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _roll
     (setq _roll (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get common_msgs::Angle3D :md5sum-) "a0a24f94640b168577ac5c59871cb550")
(setf (get common_msgs::Angle3D :datatype-) "common_msgs/Angle3D")
(setf (get common_msgs::Angle3D :definition-)
      "float32 heading   # 航向角
float32 pitch   # 俯仰角
float32 roll # 横滚角
")



(provide :common_msgs/Angle3D "a0a24f94640b168577ac5c59871cb550")


