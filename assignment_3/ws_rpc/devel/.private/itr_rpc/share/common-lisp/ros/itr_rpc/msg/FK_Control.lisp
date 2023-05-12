; Auto-generated. Do not edit!


(cl:in-package itr_rpc-msg)


;//! \htmlinclude FK_Control.msg.html

(cl:defclass <FK_Control> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (configuration
    :reader configuration
    :initarg :configuration
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass FK_Control (<FK_Control>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FK_Control>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FK_Control)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name itr_rpc-msg:<FK_Control> is deprecated: use itr_rpc-msg:FK_Control instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <FK_Control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader itr_rpc-msg:header-val is deprecated.  Use itr_rpc-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'configuration-val :lambda-list '(m))
(cl:defmethod configuration-val ((m <FK_Control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader itr_rpc-msg:configuration-val is deprecated.  Use itr_rpc-msg:configuration instead.")
  (configuration m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FK_Control>) ostream)
  "Serializes a message object of type '<FK_Control>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'configuration))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'configuration))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FK_Control>) istream)
  "Deserializes a message object of type '<FK_Control>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'configuration) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'configuration)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FK_Control>)))
  "Returns string type for a message object of type '<FK_Control>"
  "itr_rpc/FK_Control")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FK_Control)))
  "Returns string type for a message object of type 'FK_Control"
  "itr_rpc/FK_Control")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FK_Control>)))
  "Returns md5sum for a message object of type '<FK_Control>"
  "f3bf0186665f4f6dd1e878e6232fdb43")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FK_Control)))
  "Returns md5sum for a message object of type 'FK_Control"
  "f3bf0186665f4f6dd1e878e6232fdb43")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FK_Control>)))
  "Returns full string definition for message of type '<FK_Control>"
  (cl:format cl:nil "# Header must contain time stamp~%Header header~%~%# Target configuration for kinematic controller~%float32[] configuration~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FK_Control)))
  "Returns full string definition for message of type 'FK_Control"
  (cl:format cl:nil "# Header must contain time stamp~%Header header~%~%# Target configuration for kinematic controller~%float32[] configuration~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FK_Control>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'configuration) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FK_Control>))
  "Converts a ROS message object to a list"
  (cl:list 'FK_Control
    (cl:cons ':header (header msg))
    (cl:cons ':configuration (configuration msg))
))
