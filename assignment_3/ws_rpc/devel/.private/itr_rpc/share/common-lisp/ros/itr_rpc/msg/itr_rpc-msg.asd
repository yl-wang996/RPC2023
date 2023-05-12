
(cl:in-package :asdf)

(defsystem "itr_rpc-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "FK_Control" :depends-on ("_package_FK_Control"))
    (:file "_package_FK_Control" :depends-on ("_package"))
  ))