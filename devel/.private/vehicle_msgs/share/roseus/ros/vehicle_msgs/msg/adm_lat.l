;; Auto-generated. Do not edit!


(when (boundp 'vehicle_msgs::adm_lat)
  (if (not (find-package "VEHICLE_MSGS"))
    (make-package "VEHICLE_MSGS"))
  (shadow 'adm_lat (find-package "VEHICLE_MSGS")))
(unless (find-package "VEHICLE_MSGS::ADM_LAT")
  (make-package "VEHICLE_MSGS::ADM_LAT"))

(in-package "ROS")
;;//! \htmlinclude adm_lat.msg.html


(defclass vehicle_msgs::adm_lat
  :super ros::object
  :slots (_Enable_lat _GPS1_Curvature_cmd _V_des _Gear_des _End _Objectfalse _obs_dis _steering_wheel_angle _lateral_offset _current_ind ))

(defmethod vehicle_msgs::adm_lat
  (:init
   (&key
    ((:Enable_lat __Enable_lat) 0)
    ((:GPS1_Curvature_cmd __GPS1_Curvature_cmd) 0.0)
    ((:V_des __V_des) 0.0)
    ((:Gear_des __Gear_des) 0)
    ((:End __End) 0)
    ((:Objectfalse __Objectfalse) 0)
    ((:obs_dis __obs_dis) 0.0)
    ((:steering_wheel_angle __steering_wheel_angle) 0.0)
    ((:lateral_offset __lateral_offset) 0.0)
    ((:current_ind __current_ind) 0)
    )
   (send-super :init)
   (setq _Enable_lat (round __Enable_lat))
   (setq _GPS1_Curvature_cmd (float __GPS1_Curvature_cmd))
   (setq _V_des (float __V_des))
   (setq _Gear_des (round __Gear_des))
   (setq _End (round __End))
   (setq _Objectfalse (round __Objectfalse))
   (setq _obs_dis (float __obs_dis))
   (setq _steering_wheel_angle (float __steering_wheel_angle))
   (setq _lateral_offset (float __lateral_offset))
   (setq _current_ind (round __current_ind))
   self)
  (:Enable_lat
   (&optional __Enable_lat)
   (if __Enable_lat (setq _Enable_lat __Enable_lat)) _Enable_lat)
  (:GPS1_Curvature_cmd
   (&optional __GPS1_Curvature_cmd)
   (if __GPS1_Curvature_cmd (setq _GPS1_Curvature_cmd __GPS1_Curvature_cmd)) _GPS1_Curvature_cmd)
  (:V_des
   (&optional __V_des)
   (if __V_des (setq _V_des __V_des)) _V_des)
  (:Gear_des
   (&optional __Gear_des)
   (if __Gear_des (setq _Gear_des __Gear_des)) _Gear_des)
  (:End
   (&optional __End)
   (if __End (setq _End __End)) _End)
  (:Objectfalse
   (&optional __Objectfalse)
   (if __Objectfalse (setq _Objectfalse __Objectfalse)) _Objectfalse)
  (:obs_dis
   (&optional __obs_dis)
   (if __obs_dis (setq _obs_dis __obs_dis)) _obs_dis)
  (:steering_wheel_angle
   (&optional __steering_wheel_angle)
   (if __steering_wheel_angle (setq _steering_wheel_angle __steering_wheel_angle)) _steering_wheel_angle)
  (:lateral_offset
   (&optional __lateral_offset)
   (if __lateral_offset (setq _lateral_offset __lateral_offset)) _lateral_offset)
  (:current_ind
   (&optional __current_ind)
   (if __current_ind (setq _current_ind __current_ind)) _current_ind)
  (:serialization-length
   ()
   (+
    ;; uint8 _Enable_lat
    1
    ;; float32 _GPS1_Curvature_cmd
    4
    ;; float32 _V_des
    4
    ;; int8 _Gear_des
    1
    ;; uint8 _End
    1
    ;; uint8 _Objectfalse
    1
    ;; float32 _obs_dis
    4
    ;; float32 _steering_wheel_angle
    4
    ;; float32 _lateral_offset
    4
    ;; int16 _current_ind
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _Enable_lat
       (write-byte _Enable_lat s)
     ;; float32 _GPS1_Curvature_cmd
       (sys::poke _GPS1_Curvature_cmd (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _V_des
       (sys::poke _V_des (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int8 _Gear_des
       (write-byte _Gear_des s)
     ;; uint8 _End
       (write-byte _End s)
     ;; uint8 _Objectfalse
       (write-byte _Objectfalse s)
     ;; float32 _obs_dis
       (sys::poke _obs_dis (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _steering_wheel_angle
       (sys::poke _steering_wheel_angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _lateral_offset
       (sys::poke _lateral_offset (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int16 _current_ind
       (write-word _current_ind s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _Enable_lat
     (setq _Enable_lat (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _GPS1_Curvature_cmd
     (setq _GPS1_Curvature_cmd (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _V_des
     (setq _V_des (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int8 _Gear_des
     (setq _Gear_des (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _Gear_des 127) (setq _Gear_des (- _Gear_des 256)))
   ;; uint8 _End
     (setq _End (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Objectfalse
     (setq _Objectfalse (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _obs_dis
     (setq _obs_dis (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _steering_wheel_angle
     (setq _steering_wheel_angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _lateral_offset
     (setq _lateral_offset (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int16 _current_ind
     (setq _current_ind (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get vehicle_msgs::adm_lat :md5sum-) "093d38f791b755925ba9f28e5792bd0c")
(setf (get vehicle_msgs::adm_lat :datatype-) "vehicle_msgs/adm_lat")
(setf (get vehicle_msgs::adm_lat :definition-)
      "uint8 Enable_lat
float32 GPS1_Curvature_cmd
float32 V_des
int8 Gear_des
uint8 End
uint8 Objectfalse
float32 obs_dis
float32 steering_wheel_angle
float32 lateral_offset
int16 current_ind
")



(provide :vehicle_msgs/adm_lat "093d38f791b755925ba9f28e5792bd0c")


