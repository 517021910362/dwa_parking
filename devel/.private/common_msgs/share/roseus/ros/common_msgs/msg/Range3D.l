;; Auto-generated. Do not edit!


(when (boundp 'common_msgs::Range3D)
  (if (not (find-package "COMMON_MSGS"))
    (make-package "COMMON_MSGS"))
  (shadow 'Range3D (find-package "COMMON_MSGS")))
(unless (find-package "COMMON_MSGS::RANGE3D")
  (make-package "COMMON_MSGS::RANGE3D"))

(in-package "ROS")
;;//! \htmlinclude Range3D.msg.html


(defclass common_msgs::Range3D
  :super ros::object
  :slots (_xMax _xMin _yMax _yMin _zMax _zMin ))

(defmethod common_msgs::Range3D
  (:init
   (&key
    ((:xMax __xMax) 0.0)
    ((:xMin __xMin) 0.0)
    ((:yMax __yMax) 0.0)
    ((:yMin __yMin) 0.0)
    ((:zMax __zMax) 0.0)
    ((:zMin __zMin) 0.0)
    )
   (send-super :init)
   (setq _xMax (float __xMax))
   (setq _xMin (float __xMin))
   (setq _yMax (float __yMax))
   (setq _yMin (float __yMin))
   (setq _zMax (float __zMax))
   (setq _zMin (float __zMin))
   self)
  (:xMax
   (&optional __xMax)
   (if __xMax (setq _xMax __xMax)) _xMax)
  (:xMin
   (&optional __xMin)
   (if __xMin (setq _xMin __xMin)) _xMin)
  (:yMax
   (&optional __yMax)
   (if __yMax (setq _yMax __yMax)) _yMax)
  (:yMin
   (&optional __yMin)
   (if __yMin (setq _yMin __yMin)) _yMin)
  (:zMax
   (&optional __zMax)
   (if __zMax (setq _zMax __zMax)) _zMax)
  (:zMin
   (&optional __zMin)
   (if __zMin (setq _zMin __zMin)) _zMin)
  (:serialization-length
   ()
   (+
    ;; float32 _xMax
    4
    ;; float32 _xMin
    4
    ;; float32 _yMax
    4
    ;; float32 _yMin
    4
    ;; float32 _zMax
    4
    ;; float32 _zMin
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _xMax
       (sys::poke _xMax (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _xMin
       (sys::poke _xMin (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yMax
       (sys::poke _yMax (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yMin
       (sys::poke _yMin (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _zMax
       (sys::poke _zMax (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _zMin
       (sys::poke _zMin (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _xMax
     (setq _xMax (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _xMin
     (setq _xMin (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yMax
     (setq _yMax (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yMin
     (setq _yMin (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _zMax
     (setq _zMax (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _zMin
     (setq _zMin (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get common_msgs::Range3D :md5sum-) "440fcab4969f9ce8d62e2fe8adcf659a")
(setf (get common_msgs::Range3D :datatype-) "common_msgs/Range3D")
(setf (get common_msgs::Range3D :definition-)
      "float32 xMax
float32 xMin
float32 yMax
float32 yMin
float32 zMax
float32 zMin
")



(provide :common_msgs/Range3D "440fcab4969f9ce8d62e2fe8adcf659a")


