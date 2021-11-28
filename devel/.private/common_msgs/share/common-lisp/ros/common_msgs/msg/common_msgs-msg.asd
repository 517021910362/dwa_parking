
(cl:in-package :asdf)

(defsystem "common_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Angle3D" :depends-on ("_package_Angle3D"))
    (:file "_package_Angle3D" :depends-on ("_package"))
    (:file "Point3D" :depends-on ("_package_Point3D"))
    (:file "_package_Point3D" :depends-on ("_package"))
    (:file "Range3D" :depends-on ("_package_Range3D"))
    (:file "_package_Range3D" :depends-on ("_package"))
  ))