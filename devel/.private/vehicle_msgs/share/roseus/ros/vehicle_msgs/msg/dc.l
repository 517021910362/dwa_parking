;; Auto-generated. Do not edit!


(when (boundp 'vehicle_msgs::dc)
  (if (not (find-package "VEHICLE_MSGS"))
    (make-package "VEHICLE_MSGS"))
  (shadow 'dc (find-package "VEHICLE_MSGS")))
(unless (find-package "VEHICLE_MSGS::DC")
  (make-package "VEHICLE_MSGS::DC"))

(in-package "ROS")
;;//! \htmlinclude dc.msg.html


(defclass vehicle_msgs::dc
  :super ros::object
  :slots (_DC_command _DC_entranceRequest _DC_parkingRequest _Excavator_AngleRoll _Excavator_Anglepitch _Excavator_AngleHeading _Excavator_PosLon _Excavator_PosLat _DC_truckFinish _MQTT_GateStatus _Excavator_ImuStatus _DC_VehControlReq _DC_DispatchReq _road_List ))

(defmethod vehicle_msgs::dc
  (:init
   (&key
    ((:DC_command __DC_command) 0)
    ((:DC_entranceRequest __DC_entranceRequest) 0)
    ((:DC_parkingRequest __DC_parkingRequest) 0)
    ((:Excavator_AngleRoll __Excavator_AngleRoll) 0.0)
    ((:Excavator_Anglepitch __Excavator_Anglepitch) 0.0)
    ((:Excavator_AngleHeading __Excavator_AngleHeading) 0.0)
    ((:Excavator_PosLon __Excavator_PosLon) 0.0)
    ((:Excavator_PosLat __Excavator_PosLat) 0.0)
    ((:DC_truckFinish __DC_truckFinish) 0)
    ((:MQTT_GateStatus __MQTT_GateStatus) 0)
    ((:Excavator_ImuStatus __Excavator_ImuStatus) 0)
    ((:DC_VehControlReq __DC_VehControlReq) 0)
    ((:DC_DispatchReq __DC_DispatchReq) 0)
    ((:road_List __road_List) "")
    )
   (send-super :init)
   (setq _DC_command (round __DC_command))
   (setq _DC_entranceRequest (round __DC_entranceRequest))
   (setq _DC_parkingRequest (round __DC_parkingRequest))
   (setq _Excavator_AngleRoll (float __Excavator_AngleRoll))
   (setq _Excavator_Anglepitch (float __Excavator_Anglepitch))
   (setq _Excavator_AngleHeading (float __Excavator_AngleHeading))
   (setq _Excavator_PosLon (float __Excavator_PosLon))
   (setq _Excavator_PosLat (float __Excavator_PosLat))
   (setq _DC_truckFinish (round __DC_truckFinish))
   (setq _MQTT_GateStatus (round __MQTT_GateStatus))
   (setq _Excavator_ImuStatus (round __Excavator_ImuStatus))
   (setq _DC_VehControlReq (round __DC_VehControlReq))
   (setq _DC_DispatchReq (round __DC_DispatchReq))
   (setq _road_List (string __road_List))
   self)
  (:DC_command
   (&optional __DC_command)
   (if __DC_command (setq _DC_command __DC_command)) _DC_command)
  (:DC_entranceRequest
   (&optional __DC_entranceRequest)
   (if __DC_entranceRequest (setq _DC_entranceRequest __DC_entranceRequest)) _DC_entranceRequest)
  (:DC_parkingRequest
   (&optional __DC_parkingRequest)
   (if __DC_parkingRequest (setq _DC_parkingRequest __DC_parkingRequest)) _DC_parkingRequest)
  (:Excavator_AngleRoll
   (&optional __Excavator_AngleRoll)
   (if __Excavator_AngleRoll (setq _Excavator_AngleRoll __Excavator_AngleRoll)) _Excavator_AngleRoll)
  (:Excavator_Anglepitch
   (&optional __Excavator_Anglepitch)
   (if __Excavator_Anglepitch (setq _Excavator_Anglepitch __Excavator_Anglepitch)) _Excavator_Anglepitch)
  (:Excavator_AngleHeading
   (&optional __Excavator_AngleHeading)
   (if __Excavator_AngleHeading (setq _Excavator_AngleHeading __Excavator_AngleHeading)) _Excavator_AngleHeading)
  (:Excavator_PosLon
   (&optional __Excavator_PosLon)
   (if __Excavator_PosLon (setq _Excavator_PosLon __Excavator_PosLon)) _Excavator_PosLon)
  (:Excavator_PosLat
   (&optional __Excavator_PosLat)
   (if __Excavator_PosLat (setq _Excavator_PosLat __Excavator_PosLat)) _Excavator_PosLat)
  (:DC_truckFinish
   (&optional __DC_truckFinish)
   (if __DC_truckFinish (setq _DC_truckFinish __DC_truckFinish)) _DC_truckFinish)
  (:MQTT_GateStatus
   (&optional __MQTT_GateStatus)
   (if __MQTT_GateStatus (setq _MQTT_GateStatus __MQTT_GateStatus)) _MQTT_GateStatus)
  (:Excavator_ImuStatus
   (&optional __Excavator_ImuStatus)
   (if __Excavator_ImuStatus (setq _Excavator_ImuStatus __Excavator_ImuStatus)) _Excavator_ImuStatus)
  (:DC_VehControlReq
   (&optional __DC_VehControlReq)
   (if __DC_VehControlReq (setq _DC_VehControlReq __DC_VehControlReq)) _DC_VehControlReq)
  (:DC_DispatchReq
   (&optional __DC_DispatchReq)
   (if __DC_DispatchReq (setq _DC_DispatchReq __DC_DispatchReq)) _DC_DispatchReq)
  (:road_List
   (&optional __road_List)
   (if __road_List (setq _road_List __road_List)) _road_List)
  (:serialization-length
   ()
   (+
    ;; uint8 _DC_command
    1
    ;; uint8 _DC_entranceRequest
    1
    ;; uint8 _DC_parkingRequest
    1
    ;; float32 _Excavator_AngleRoll
    4
    ;; float32 _Excavator_Anglepitch
    4
    ;; float32 _Excavator_AngleHeading
    4
    ;; float32 _Excavator_PosLon
    4
    ;; float32 _Excavator_PosLat
    4
    ;; uint8 _DC_truckFinish
    1
    ;; uint8 _MQTT_GateStatus
    1
    ;; uint8 _Excavator_ImuStatus
    1
    ;; uint8 _DC_VehControlReq
    1
    ;; uint8 _DC_DispatchReq
    1
    ;; string _road_List
    4 (length _road_List)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _DC_command
       (write-byte _DC_command s)
     ;; uint8 _DC_entranceRequest
       (write-byte _DC_entranceRequest s)
     ;; uint8 _DC_parkingRequest
       (write-byte _DC_parkingRequest s)
     ;; float32 _Excavator_AngleRoll
       (sys::poke _Excavator_AngleRoll (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Excavator_Anglepitch
       (sys::poke _Excavator_Anglepitch (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Excavator_AngleHeading
       (sys::poke _Excavator_AngleHeading (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Excavator_PosLon
       (sys::poke _Excavator_PosLon (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Excavator_PosLat
       (sys::poke _Excavator_PosLat (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _DC_truckFinish
       (write-byte _DC_truckFinish s)
     ;; uint8 _MQTT_GateStatus
       (write-byte _MQTT_GateStatus s)
     ;; uint8 _Excavator_ImuStatus
       (write-byte _Excavator_ImuStatus s)
     ;; uint8 _DC_VehControlReq
       (write-byte _DC_VehControlReq s)
     ;; uint8 _DC_DispatchReq
       (write-byte _DC_DispatchReq s)
     ;; string _road_List
       (write-long (length _road_List) s) (princ _road_List s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _DC_command
     (setq _DC_command (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _DC_entranceRequest
     (setq _DC_entranceRequest (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _DC_parkingRequest
     (setq _DC_parkingRequest (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _Excavator_AngleRoll
     (setq _Excavator_AngleRoll (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Excavator_Anglepitch
     (setq _Excavator_Anglepitch (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Excavator_AngleHeading
     (setq _Excavator_AngleHeading (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Excavator_PosLon
     (setq _Excavator_PosLon (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Excavator_PosLat
     (setq _Excavator_PosLat (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _DC_truckFinish
     (setq _DC_truckFinish (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _MQTT_GateStatus
     (setq _MQTT_GateStatus (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Excavator_ImuStatus
     (setq _Excavator_ImuStatus (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _DC_VehControlReq
     (setq _DC_VehControlReq (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _DC_DispatchReq
     (setq _DC_DispatchReq (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; string _road_List
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _road_List (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get vehicle_msgs::dc :md5sum-) "ea6e5c96799e7b32503d5842a24d9a14")
(setf (get vehicle_msgs::dc :datatype-) "vehicle_msgs/dc")
(setf (get vehicle_msgs::dc :definition-)
      "uint8 DC_command
uint8 DC_entranceRequest
uint8 DC_parkingRequest
float32 Excavator_AngleRoll
float32 Excavator_Anglepitch
float32 Excavator_AngleHeading
float32 Excavator_PosLon
float32 Excavator_PosLat
uint8 DC_truckFinish
uint8 MQTT_GateStatus
uint8 Excavator_ImuStatus
uint8 DC_VehControlReq
uint8 DC_DispatchReq
string road_List

")



(provide :vehicle_msgs/dc "ea6e5c96799e7b32503d5842a24d9a14")


