
(cl:in-package :asdf)

(defsystem "parking_lot_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "parking_lot" :depends-on ("_package_parking_lot"))
    (:file "_package_parking_lot" :depends-on ("_package"))
    (:file "parking_lots" :depends-on ("_package_parking_lots"))
    (:file "_package_parking_lots" :depends-on ("_package"))
  ))