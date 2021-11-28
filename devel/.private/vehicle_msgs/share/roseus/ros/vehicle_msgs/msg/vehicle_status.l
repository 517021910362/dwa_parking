;; Auto-generated. Do not edit!


(when (boundp 'vehicle_msgs::vehicle_status)
  (if (not (find-package "VEHICLE_MSGS"))
    (make-package "VEHICLE_MSGS"))
  (shadow 'vehicle_status (find-package "VEHICLE_MSGS")))
(unless (find-package "VEHICLE_MSGS::VEHICLE_STATUS")
  (make-package "VEHICLE_MSGS::VEHICLE_STATUS"))

(in-package "ROS")
;;//! \htmlinclude vehicle_status.msg.html


(defclass vehicle_msgs::vehicle_status
  :super ros::object
  :slots (_head1 _head2 _length _steering _brake_status _pedal_ratio _gear_position _speed_left_front _speed_right_front _speed_left_rear _speed_right_rear _command _work_mode _racing_num _fault_type _checksum ))

(defmethod vehicle_msgs::vehicle_status
  (:init
   (&key
    ((:head1 __head1) 0)
    ((:head2 __head2) 0)
    ((:length __length) 0)
    ((:steering __steering) 0)
    ((:brake_status __brake_status) 0)
    ((:pedal_ratio __pedal_ratio) 0)
    ((:gear_position __gear_position) 0)
    ((:speed_left_front __speed_left_front) 0)
    ((:speed_right_front __speed_right_front) 0)
    ((:speed_left_rear __speed_left_rear) 0)
    ((:speed_right_rear __speed_right_rear) 0)
    ((:command __command) 0)
    ((:work_mode __work_mode) 0)
    ((:racing_num __racing_num) 0)
    ((:fault_type __fault_type) 0)
    ((:checksum __checksum) 0)
    )
   (send-super :init)
   (setq _head1 (round __head1))
   (setq _head2 (round __head2))
   (setq _length (round __length))
   (setq _steering (round __steering))
   (setq _brake_status (round __brake_status))
   (setq _pedal_ratio (round __pedal_ratio))
   (setq _gear_position (round __gear_position))
   (setq _speed_left_front (round __speed_left_front))
   (setq _speed_right_front (round __speed_right_front))
   (setq _speed_left_rear (round __speed_left_rear))
   (setq _speed_right_rear (round __speed_right_rear))
   (setq _command (round __command))
   (setq _work_mode (round __work_mode))
   (setq _racing_num (round __racing_num))
   (setq _fault_type (round __fault_type))
   (setq _checksum (round __checksum))
   self)
  (:head1
   (&optional __head1)
   (if __head1 (setq _head1 __head1)) _head1)
  (:head2
   (&optional __head2)
   (if __head2 (setq _head2 __head2)) _head2)
  (:length
   (&optional __length)
   (if __length (setq _length __length)) _length)
  (:steering
   (&optional __steering)
   (if __steering (setq _steering __steering)) _steering)
  (:brake_status
   (&optional __brake_status)
   (if __brake_status (setq _brake_status __brake_status)) _brake_status)
  (:pedal_ratio
   (&optional __pedal_ratio)
   (if __pedal_ratio (setq _pedal_ratio __pedal_ratio)) _pedal_ratio)
  (:gear_position
   (&optional __gear_position)
   (if __gear_position (setq _gear_position __gear_position)) _gear_position)
  (:speed_left_front
   (&optional __speed_left_front)
   (if __speed_left_front (setq _speed_left_front __speed_left_front)) _speed_left_front)
  (:speed_right_front
   (&optional __speed_right_front)
   (if __speed_right_front (setq _speed_right_front __speed_right_front)) _speed_right_front)
  (:speed_left_rear
   (&optional __speed_left_rear)
   (if __speed_left_rear (setq _speed_left_rear __speed_left_rear)) _speed_left_rear)
  (:speed_right_rear
   (&optional __speed_right_rear)
   (if __speed_right_rear (setq _speed_right_rear __speed_right_rear)) _speed_right_rear)
  (:command
   (&optional __command)
   (if __command (setq _command __command)) _command)
  (:work_mode
   (&optional __work_mode)
   (if __work_mode (setq _work_mode __work_mode)) _work_mode)
  (:racing_num
   (&optional __racing_num)
   (if __racing_num (setq _racing_num __racing_num)) _racing_num)
  (:fault_type
   (&optional __fault_type)
   (if __fault_type (setq _fault_type __fault_type)) _fault_type)
  (:checksum
   (&optional __checksum)
   (if __checksum (setq _checksum __checksum)) _checksum)
  (:serialization-length
   ()
   (+
    ;; uint8 _head1
    1
    ;; uint8 _head2
    1
    ;; uint8 _length
    1
    ;; uint8 _steering
    1
    ;; uint8 _brake_status
    1
    ;; uint8 _pedal_ratio
    1
    ;; uint8 _gear_position
    1
    ;; uint16 _speed_left_front
    2
    ;; uint16 _speed_right_front
    2
    ;; uint16 _speed_left_rear
    2
    ;; uint16 _speed_right_rear
    2
    ;; uint8 _command
    1
    ;; uint8 _work_mode
    1
    ;; uint8 _racing_num
    1
    ;; uint8 _fault_type
    1
    ;; uint16 _checksum
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _head1
       (write-byte _head1 s)
     ;; uint8 _head2
       (write-byte _head2 s)
     ;; uint8 _length
       (write-byte _length s)
     ;; uint8 _steering
       (write-byte _steering s)
     ;; uint8 _brake_status
       (write-byte _brake_status s)
     ;; uint8 _pedal_ratio
       (write-byte _pedal_ratio s)
     ;; uint8 _gear_position
       (write-byte _gear_position s)
     ;; uint16 _speed_left_front
       (write-word _speed_left_front s)
     ;; uint16 _speed_right_front
       (write-word _speed_right_front s)
     ;; uint16 _speed_left_rear
       (write-word _speed_left_rear s)
     ;; uint16 _speed_right_rear
       (write-word _speed_right_rear s)
     ;; uint8 _command
       (write-byte _command s)
     ;; uint8 _work_mode
       (write-byte _work_mode s)
     ;; uint8 _racing_num
       (write-byte _racing_num s)
     ;; uint8 _fault_type
       (write-byte _fault_type s)
     ;; uint16 _checksum
       (write-word _checksum s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _head1
     (setq _head1 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _head2
     (setq _head2 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _length
     (setq _length (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _steering
     (setq _steering (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _brake_status
     (setq _brake_status (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _pedal_ratio
     (setq _pedal_ratio (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _gear_position
     (setq _gear_position (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint16 _speed_left_front
     (setq _speed_left_front (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _speed_right_front
     (setq _speed_right_front (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _speed_left_rear
     (setq _speed_left_rear (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _speed_right_rear
     (setq _speed_right_rear (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint8 _command
     (setq _command (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _work_mode
     (setq _work_mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _racing_num
     (setq _racing_num (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _fault_type
     (setq _fault_type (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint16 _checksum
     (setq _checksum (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get vehicle_msgs::vehicle_status :md5sum-) "846750d88d04873a7a68c897999f240c")
(setf (get vehicle_msgs::vehicle_status :datatype-) "vehicle_msgs/vehicle_status")
(setf (get vehicle_msgs::vehicle_status :definition-)
      "uint8 head1
uint8 head2
uint8 length
uint8 steering
uint8 brake_status
uint8 pedal_ratio
uint8 gear_position
uint16 speed_left_front
uint16 speed_right_front
uint16 speed_left_rear
uint16 speed_right_rear
uint8 command
uint8 work_mode
uint8 racing_num
uint8 fault_type
uint16 checksum



")



(provide :vehicle_msgs/vehicle_status "846750d88d04873a7a68c897999f240c")


