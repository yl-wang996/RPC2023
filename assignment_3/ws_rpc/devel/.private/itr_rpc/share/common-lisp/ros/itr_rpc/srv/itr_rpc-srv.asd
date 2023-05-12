
(cl:in-package :asdf)

(defsystem "itr_rpc-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "IK_Solve" :depends-on ("_package_IK_Solve"))
    (:file "_package_IK_Solve" :depends-on ("_package"))
    (:file "LineCollision" :depends-on ("_package_LineCollision"))
    (:file "_package_LineCollision" :depends-on ("_package"))
    (:file "PointCollision" :depends-on ("_package_PointCollision"))
    (:file "_package_PointCollision" :depends-on ("_package"))
  ))