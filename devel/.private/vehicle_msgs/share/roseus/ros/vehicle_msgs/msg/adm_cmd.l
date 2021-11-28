;; Auto-generated. Do not edit!


(when (boundp 'vehicle_msgs::adm_cmd)
  (if (not (find-package "VEHICLE_MSGS"))
    (make-package "VEHICLE_MSGS"))
  (shadow 'adm_cmd (find-package "VEHICLE_MSGS")))
(unless (find-package "VEHICLE_MSGS::ADM_CMD")
  (make-package "VEHICLE_MSGS::ADM_CMD"))

(in-package "ROS")
;;//! \htmlinclude adm_cmd.msg.html


(defclass vehicle_msgs::adm_cmd
  :super ros::object
  :slots (_AccPed _AccPed_enable _ADM_FaultLevel _Fog_Light _Horn _Hydraulic_Brake _High_BeamLigh _Low_BeamLight _Turn_Signal _Double_Light _Night_Light _Defroster_Control _Wiper_Control _Amble_Brake _Compartment_Control _Emergency_Brake _Load_Brake _Engine_Start _Engine_Stop _Road_DryorWet _Switch_DynamicorEconomical _Slope _Gear _GPS1_Curvature_cmd _finish_over ))

(defmethod vehicle_msgs::adm_cmd
  (:init
   (&key
    ((:AccPed __AccPed) 0)
    ((:AccPed_enable __AccPed_enable) 0)
    ((:ADM_FaultLevel __ADM_FaultLevel) 0)
    ((:Fog_Light __Fog_Light) 0)
    ((:Horn __Horn) 0)
    ((:Hydraulic_Brake __Hydraulic_Brake) 0)
    ((:High_BeamLigh __High_BeamLigh) 0)
    ((:Low_BeamLight __Low_BeamLight) 0)
    ((:Turn_Signal __Turn_Signal) 0)
    ((:Double_Light __Double_Light) 0)
    ((:Night_Light __Night_Light) 0)
    ((:Defroster_Control __Defroster_Control) 0)
    ((:Wiper_Control __Wiper_Control) 0)
    ((:Amble_Brake __Amble_Brake) 0)
    ((:Compartment_Control __Compartment_Control) 0)
    ((:Emergency_Brake __Emergency_Brake) 0)
    ((:Load_Brake __Load_Brake) 0)
    ((:Engine_Start __Engine_Start) 0)
    ((:Engine_Stop __Engine_Stop) 0)
    ((:Road_DryorWet __Road_DryorWet) 0)
    ((:Switch_DynamicorEconomical __Switch_DynamicorEconomical) 0)
    ((:Slope __Slope) 0)
    ((:Gear __Gear) 0)
    ((:GPS1_Curvature_cmd __GPS1_Curvature_cmd) 0.0)
    ((:finish_over __finish_over) 0)
    )
   (send-super :init)
   (setq _AccPed (round __AccPed))
   (setq _AccPed_enable (round __AccPed_enable))
   (setq _ADM_FaultLevel (round __ADM_FaultLevel))
   (setq _Fog_Light (round __Fog_Light))
   (setq _Horn (round __Horn))
   (setq _Hydraulic_Brake (round __Hydraulic_Brake))
   (setq _High_BeamLigh (round __High_BeamLigh))
   (setq _Low_BeamLight (round __Low_BeamLight))
   (setq _Turn_Signal (round __Turn_Signal))
   (setq _Double_Light (round __Double_Light))
   (setq _Night_Light (round __Night_Light))
   (setq _Defroster_Control (round __Defroster_Control))
   (setq _Wiper_Control (round __Wiper_Control))
   (setq _Amble_Brake (round __Amble_Brake))
   (setq _Compartment_Control (round __Compartment_Control))
   (setq _Emergency_Brake (round __Emergency_Brake))
   (setq _Load_Brake (round __Load_Brake))
   (setq _Engine_Start (round __Engine_Start))
   (setq _Engine_Stop (round __Engine_Stop))
   (setq _Road_DryorWet (round __Road_DryorWet))
   (setq _Switch_DynamicorEconomical (round __Switch_DynamicorEconomical))
   (setq _Slope (round __Slope))
   (setq _Gear (round __Gear))
   (setq _GPS1_Curvature_cmd (float __GPS1_Curvature_cmd))
   (setq _finish_over (round __finish_over))
   self)
  (:AccPed
   (&optional __AccPed)
   (if __AccPed (setq _AccPed __AccPed)) _AccPed)
  (:AccPed_enable
   (&optional __AccPed_enable)
   (if __AccPed_enable (setq _AccPed_enable __AccPed_enable)) _AccPed_enable)
  (:ADM_FaultLevel
   (&optional __ADM_FaultLevel)
   (if __ADM_FaultLevel (setq _ADM_FaultLevel __ADM_FaultLevel)) _ADM_FaultLevel)
  (:Fog_Light
   (&optional __Fog_Light)
   (if __Fog_Light (setq _Fog_Light __Fog_Light)) _Fog_Light)
  (:Horn
   (&optional __Horn)
   (if __Horn (setq _Horn __Horn)) _Horn)
  (:Hydraulic_Brake
   (&optional __Hydraulic_Brake)
   (if __Hydraulic_Brake (setq _Hydraulic_Brake __Hydraulic_Brake)) _Hydraulic_Brake)
  (:High_BeamLigh
   (&optional __High_BeamLigh)
   (if __High_BeamLigh (setq _High_BeamLigh __High_BeamLigh)) _High_BeamLigh)
  (:Low_BeamLight
   (&optional __Low_BeamLight)
   (if __Low_BeamLight (setq _Low_BeamLight __Low_BeamLight)) _Low_BeamLight)
  (:Turn_Signal
   (&optional __Turn_Signal)
   (if __Turn_Signal (setq _Turn_Signal __Turn_Signal)) _Turn_Signal)
  (:Double_Light
   (&optional __Double_Light)
   (if __Double_Light (setq _Double_Light __Double_Light)) _Double_Light)
  (:Night_Light
   (&optional __Night_Light)
   (if __Night_Light (setq _Night_Light __Night_Light)) _Night_Light)
  (:Defroster_Control
   (&optional __Defroster_Control)
   (if __Defroster_Control (setq _Defroster_Control __Defroster_Control)) _Defroster_Control)
  (:Wiper_Control
   (&optional __Wiper_Control)
   (if __Wiper_Control (setq _Wiper_Control __Wiper_Control)) _Wiper_Control)
  (:Amble_Brake
   (&optional __Amble_Brake)
   (if __Amble_Brake (setq _Amble_Brake __Amble_Brake)) _Amble_Brake)
  (:Compartment_Control
   (&optional __Compartment_Control)
   (if __Compartment_Control (setq _Compartment_Control __Compartment_Control)) _Compartment_Control)
  (:Emergency_Brake
   (&optional __Emergency_Brake)
   (if __Emergency_Brake (setq _Emergency_Brake __Emergency_Brake)) _Emergency_Brake)
  (:Load_Brake
   (&optional __Load_Brake)
   (if __Load_Brake (setq _Load_Brake __Load_Brake)) _Load_Brake)
  (:Engine_Start
   (&optional __Engine_Start)
   (if __Engine_Start (setq _Engine_Start __Engine_Start)) _Engine_Start)
  (:Engine_Stop
   (&optional __Engine_Stop)
   (if __Engine_Stop (setq _Engine_Stop __Engine_Stop)) _Engine_Stop)
  (:Road_DryorWet
   (&optional __Road_DryorWet)
   (if __Road_DryorWet (setq _Road_DryorWet __Road_DryorWet)) _Road_DryorWet)
  (:Switch_DynamicorEconomical
   (&optional __Switch_DynamicorEconomical)
   (if __Switch_DynamicorEconomical (setq _Switch_DynamicorEconomical __Switch_DynamicorEconomical)) _Switch_DynamicorEconomical)
  (:Slope
   (&optional __Slope)
   (if __Slope (setq _Slope __Slope)) _Slope)
  (:Gear
   (&optional __Gear)
   (if __Gear (setq _Gear __Gear)) _Gear)
  (:GPS1_Curvature_cmd
   (&optional __GPS1_Curvature_cmd)
   (if __GPS1_Curvature_cmd (setq _GPS1_Curvature_cmd __GPS1_Curvature_cmd)) _GPS1_Curvature_cmd)
  (:finish_over
   (&optional __finish_over)
   (if __finish_over (setq _finish_over __finish_over)) _finish_over)
  (:serialization-length
   ()
   (+
    ;; uint8 _AccPed
    1
    ;; uint8 _AccPed_enable
    1
    ;; uint8 _ADM_FaultLevel
    1
    ;; uint8 _Fog_Light
    1
    ;; uint8 _Horn
    1
    ;; uint8 _Hydraulic_Brake
    1
    ;; uint8 _High_BeamLigh
    1
    ;; uint8 _Low_BeamLight
    1
    ;; uint8 _Turn_Signal
    1
    ;; uint8 _Double_Light
    1
    ;; uint8 _Night_Light
    1
    ;; uint8 _Defroster_Control
    1
    ;; uint8 _Wiper_Control
    1
    ;; uint8 _Amble_Brake
    1
    ;; uint8 _Compartment_Control
    1
    ;; uint8 _Emergency_Brake
    1
    ;; uint8 _Load_Brake
    1
    ;; uint8 _Engine_Start
    1
    ;; uint8 _Engine_Stop
    1
    ;; uint8 _Road_DryorWet
    1
    ;; uint8 _Switch_DynamicorEconomical
    1
    ;; uint8 _Slope
    1
    ;; uint8 _Gear
    1
    ;; float32 _GPS1_Curvature_cmd
    4
    ;; uint8 _finish_over
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _AccPed
       (write-byte _AccPed s)
     ;; uint8 _AccPed_enable
       (write-byte _AccPed_enable s)
     ;; uint8 _ADM_FaultLevel
       (write-byte _ADM_FaultLevel s)
     ;; uint8 _Fog_Light
       (write-byte _Fog_Light s)
     ;; uint8 _Horn
       (write-byte _Horn s)
     ;; uint8 _Hydraulic_Brake
       (write-byte _Hydraulic_Brake s)
     ;; uint8 _High_BeamLigh
       (write-byte _High_BeamLigh s)
     ;; uint8 _Low_BeamLight
       (write-byte _Low_BeamLight s)
     ;; uint8 _Turn_Signal
       (write-byte _Turn_Signal s)
     ;; uint8 _Double_Light
       (write-byte _Double_Light s)
     ;; uint8 _Night_Light
       (write-byte _Night_Light s)
     ;; uint8 _Defroster_Control
       (write-byte _Defroster_Control s)
     ;; uint8 _Wiper_Control
       (write-byte _Wiper_Control s)
     ;; uint8 _Amble_Brake
       (write-byte _Amble_Brake s)
     ;; uint8 _Compartment_Control
       (write-byte _Compartment_Control s)
     ;; uint8 _Emergency_Brake
       (write-byte _Emergency_Brake s)
     ;; uint8 _Load_Brake
       (write-byte _Load_Brake s)
     ;; uint8 _Engine_Start
       (write-byte _Engine_Start s)
     ;; uint8 _Engine_Stop
       (write-byte _Engine_Stop s)
     ;; uint8 _Road_DryorWet
       (write-byte _Road_DryorWet s)
     ;; uint8 _Switch_DynamicorEconomical
       (write-byte _Switch_DynamicorEconomical s)
     ;; uint8 _Slope
       (write-byte _Slope s)
     ;; uint8 _Gear
       (write-byte _Gear s)
     ;; float32 _GPS1_Curvature_cmd
       (sys::poke _GPS1_Curvature_cmd (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _finish_over
       (write-byte _finish_over s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _AccPed
     (setq _AccPed (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _AccPed_enable
     (setq _AccPed_enable (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _ADM_FaultLevel
     (setq _ADM_FaultLevel (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Fog_Light
     (setq _Fog_Light (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Horn
     (setq _Horn (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Hydraulic_Brake
     (setq _Hydraulic_Brake (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _High_BeamLigh
     (setq _High_BeamLigh (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Low_BeamLight
     (setq _Low_BeamLight (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Turn_Signal
     (setq _Turn_Signal (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Double_Light
     (setq _Double_Light (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Night_Light
     (setq _Night_Light (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Defroster_Control
     (setq _Defroster_Control (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Wiper_Control
     (setq _Wiper_Control (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Amble_Brake
     (setq _Amble_Brake (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Compartment_Control
     (setq _Compartment_Control (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Emergency_Brake
     (setq _Emergency_Brake (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Load_Brake
     (setq _Load_Brake (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Engine_Start
     (setq _Engine_Start (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Engine_Stop
     (setq _Engine_Stop (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Road_DryorWet
     (setq _Road_DryorWet (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Switch_DynamicorEconomical
     (setq _Switch_DynamicorEconomical (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Slope
     (setq _Slope (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Gear
     (setq _Gear (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _GPS1_Curvature_cmd
     (setq _GPS1_Curvature_cmd (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _finish_over
     (setq _finish_over (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get vehicle_msgs::adm_cmd :md5sum-) "03c23fc13499203340068a71426d1dfc")
(setf (get vehicle_msgs::adm_cmd :datatype-) "vehicle_msgs/adm_cmd")
(setf (get vehicle_msgs::adm_cmd :definition-)
      "uint8 AccPed
uint8 AccPed_enable
uint8 ADM_FaultLevel
uint8 Fog_Light
uint8 Horn
uint8 Hydraulic_Brake
uint8 High_BeamLigh
uint8 Low_BeamLight
uint8 Turn_Signal
uint8 Double_Light

uint8 Night_Light
uint8 Defroster_Control
uint8 Wiper_Control
uint8 Amble_Brake
uint8 Compartment_Control
uint8 Emergency_Brake
uint8 Load_Brake
uint8 Engine_Start
uint8 Engine_Stop
uint8 Road_DryorWet
uint8 Switch_DynamicorEconomical
uint8 Slope
uint8 Gear
float32 GPS1_Curvature_cmd
uint8 finish_over


")



(provide :vehicle_msgs/adm_cmd "03c23fc13499203340068a71426d1dfc")


