;; Auto-generated. Do not edit!


(when (boundp 'vehicle_msgs::vehicle_download)
  (if (not (find-package "VEHICLE_MSGS"))
    (make-package "VEHICLE_MSGS"))
  (shadow 'vehicle_download (find-package "VEHICLE_MSGS")))
(unless (find-package "VEHICLE_MSGS::VEHICLE_DOWNLOAD")
  (make-package "VEHICLE_MSGS::VEHICLE_DOWNLOAD"))

(in-package "ROS")
;;//! \htmlinclude vehicle_download.msg.html


(defclass vehicle_msgs::vehicle_download
  :super ros::object
  :slots (_TarAccler _Tar_steerangle _Tar_gear _DiveoffReq _ADS_mode _Stoprequest _EndOfTravel _Station_In_Out _TurnSignal _DoubleLight _HummerSts _latAcceleration _longAcceleration _Acceleration _Yaw_rate _Slope ))

(defmethod vehicle_msgs::vehicle_download
  (:init
   (&key
    ((:TarAccler __TarAccler) 0.0)
    ((:Tar_steerangle __Tar_steerangle) 0.0)
    ((:Tar_gear __Tar_gear) 0)
    ((:DiveoffReq __DiveoffReq) 0)
    ((:ADS_mode __ADS_mode) 0)
    ((:Stoprequest __Stoprequest) 0)
    ((:EndOfTravel __EndOfTravel) 0)
    ((:Station_In_Out __Station_In_Out) 0)
    ((:TurnSignal __TurnSignal) 0)
    ((:DoubleLight __DoubleLight) 0)
    ((:HummerSts __HummerSts) 0)
    ((:latAcceleration __latAcceleration) 0.0)
    ((:longAcceleration __longAcceleration) 0.0)
    ((:Acceleration __Acceleration) 0.0)
    ((:Yaw_rate __Yaw_rate) 0.0)
    ((:Slope __Slope) 0.0)
    )
   (send-super :init)
   (setq _TarAccler (float __TarAccler))
   (setq _Tar_steerangle (float __Tar_steerangle))
   (setq _Tar_gear (round __Tar_gear))
   (setq _DiveoffReq (round __DiveoffReq))
   (setq _ADS_mode (round __ADS_mode))
   (setq _Stoprequest (round __Stoprequest))
   (setq _EndOfTravel (round __EndOfTravel))
   (setq _Station_In_Out (round __Station_In_Out))
   (setq _TurnSignal (round __TurnSignal))
   (setq _DoubleLight (round __DoubleLight))
   (setq _HummerSts (round __HummerSts))
   (setq _latAcceleration (float __latAcceleration))
   (setq _longAcceleration (float __longAcceleration))
   (setq _Acceleration (float __Acceleration))
   (setq _Yaw_rate (float __Yaw_rate))
   (setq _Slope (float __Slope))
   self)
  (:TarAccler
   (&optional __TarAccler)
   (if __TarAccler (setq _TarAccler __TarAccler)) _TarAccler)
  (:Tar_steerangle
   (&optional __Tar_steerangle)
   (if __Tar_steerangle (setq _Tar_steerangle __Tar_steerangle)) _Tar_steerangle)
  (:Tar_gear
   (&optional __Tar_gear)
   (if __Tar_gear (setq _Tar_gear __Tar_gear)) _Tar_gear)
  (:DiveoffReq
   (&optional __DiveoffReq)
   (if __DiveoffReq (setq _DiveoffReq __DiveoffReq)) _DiveoffReq)
  (:ADS_mode
   (&optional __ADS_mode)
   (if __ADS_mode (setq _ADS_mode __ADS_mode)) _ADS_mode)
  (:Stoprequest
   (&optional __Stoprequest)
   (if __Stoprequest (setq _Stoprequest __Stoprequest)) _Stoprequest)
  (:EndOfTravel
   (&optional __EndOfTravel)
   (if __EndOfTravel (setq _EndOfTravel __EndOfTravel)) _EndOfTravel)
  (:Station_In_Out
   (&optional __Station_In_Out)
   (if __Station_In_Out (setq _Station_In_Out __Station_In_Out)) _Station_In_Out)
  (:TurnSignal
   (&optional __TurnSignal)
   (if __TurnSignal (setq _TurnSignal __TurnSignal)) _TurnSignal)
  (:DoubleLight
   (&optional __DoubleLight)
   (if __DoubleLight (setq _DoubleLight __DoubleLight)) _DoubleLight)
  (:HummerSts
   (&optional __HummerSts)
   (if __HummerSts (setq _HummerSts __HummerSts)) _HummerSts)
  (:latAcceleration
   (&optional __latAcceleration)
   (if __latAcceleration (setq _latAcceleration __latAcceleration)) _latAcceleration)
  (:longAcceleration
   (&optional __longAcceleration)
   (if __longAcceleration (setq _longAcceleration __longAcceleration)) _longAcceleration)
  (:Acceleration
   (&optional __Acceleration)
   (if __Acceleration (setq _Acceleration __Acceleration)) _Acceleration)
  (:Yaw_rate
   (&optional __Yaw_rate)
   (if __Yaw_rate (setq _Yaw_rate __Yaw_rate)) _Yaw_rate)
  (:Slope
   (&optional __Slope)
   (if __Slope (setq _Slope __Slope)) _Slope)
  (:serialization-length
   ()
   (+
    ;; float32 _TarAccler
    4
    ;; float32 _Tar_steerangle
    4
    ;; uint8 _Tar_gear
    1
    ;; uint8 _DiveoffReq
    1
    ;; uint8 _ADS_mode
    1
    ;; uint8 _Stoprequest
    1
    ;; uint8 _EndOfTravel
    1
    ;; uint8 _Station_In_Out
    1
    ;; uint8 _TurnSignal
    1
    ;; uint8 _DoubleLight
    1
    ;; uint8 _HummerSts
    1
    ;; float32 _latAcceleration
    4
    ;; float32 _longAcceleration
    4
    ;; float32 _Acceleration
    4
    ;; float32 _Yaw_rate
    4
    ;; float32 _Slope
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _TarAccler
       (sys::poke _TarAccler (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Tar_steerangle
       (sys::poke _Tar_steerangle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _Tar_gear
       (write-byte _Tar_gear s)
     ;; uint8 _DiveoffReq
       (write-byte _DiveoffReq s)
     ;; uint8 _ADS_mode
       (write-byte _ADS_mode s)
     ;; uint8 _Stoprequest
       (write-byte _Stoprequest s)
     ;; uint8 _EndOfTravel
       (write-byte _EndOfTravel s)
     ;; uint8 _Station_In_Out
       (write-byte _Station_In_Out s)
     ;; uint8 _TurnSignal
       (write-byte _TurnSignal s)
     ;; uint8 _DoubleLight
       (write-byte _DoubleLight s)
     ;; uint8 _HummerSts
       (write-byte _HummerSts s)
     ;; float32 _latAcceleration
       (sys::poke _latAcceleration (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _longAcceleration
       (sys::poke _longAcceleration (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Acceleration
       (sys::poke _Acceleration (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Yaw_rate
       (sys::poke _Yaw_rate (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Slope
       (sys::poke _Slope (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _TarAccler
     (setq _TarAccler (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Tar_steerangle
     (setq _Tar_steerangle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _Tar_gear
     (setq _Tar_gear (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _DiveoffReq
     (setq _DiveoffReq (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _ADS_mode
     (setq _ADS_mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Stoprequest
     (setq _Stoprequest (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _EndOfTravel
     (setq _EndOfTravel (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Station_In_Out
     (setq _Station_In_Out (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _TurnSignal
     (setq _TurnSignal (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _DoubleLight
     (setq _DoubleLight (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _HummerSts
     (setq _HummerSts (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _latAcceleration
     (setq _latAcceleration (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _longAcceleration
     (setq _longAcceleration (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Acceleration
     (setq _Acceleration (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Yaw_rate
     (setq _Yaw_rate (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Slope
     (setq _Slope (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get vehicle_msgs::vehicle_download :md5sum-) "b1c7accc64c1d758d5af51e3905238ba")
(setf (get vehicle_msgs::vehicle_download :datatype-) "vehicle_msgs/vehicle_download")
(setf (get vehicle_msgs::vehicle_download :definition-)
      "float32 TarAccler
float32 Tar_steerangle
uint8 Tar_gear
uint8 DiveoffReq
uint8 ADS_mode
uint8 Stoprequest
uint8 EndOfTravel
uint8 Station_In_Out
uint8 TurnSignal
uint8 DoubleLight
uint8 HummerSts
float32 latAcceleration
float32 longAcceleration
float32 Acceleration
float32 Yaw_rate
float32 Slope
")



(provide :vehicle_msgs/vehicle_download "b1c7accc64c1d758d5af51e3905238ba")


