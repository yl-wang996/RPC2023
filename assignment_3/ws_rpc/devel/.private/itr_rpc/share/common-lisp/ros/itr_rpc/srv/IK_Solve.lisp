; Auto-generated. Do not edit!


(cl:in-package itr_rpc-srv)


;//! \htmlinclude IK_Solve-request.msg.html

(cl:defclass <IK_Solve-request> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (position
    :reader position
    :initarg :position
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0))
   (orientation
    :reader orientation
    :initarg :orientation
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0))
   (seed
    :reader seed
    :initarg :seed
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass IK_Solve-request (<IK_Solve-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <IK_Solve-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'IK_Solve-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name itr_rpc-srv:<IK_Solve-request> is deprecated: use itr_rpc-srv:IK_Solve-request instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <IK_Solve-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader itr_rpc-srv:header-val is deprecated.  Use itr_rpc-srv:header instead.")
  (header m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <IK_Solve-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader itr_rpc-srv:position-val is deprecated.  Use itr_rpc-srv:position instead.")
  (position m))

(cl:ensure-generic-function 'orientation-val :lambda-list '(m))
(cl:defmethod orientation-val ((m <IK_Solve-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader itr_rpc-srv:orientation-val is deprecated.  Use itr_rpc-srv:orientation instead.")
  (orientation m))

(cl:ensure-generic-function 'seed-val :lambda-list '(m))
(cl:defmethod seed-val ((m <IK_Solve-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader itr_rpc-srv:seed-val is deprecated.  Use itr_rpc-srv:seed instead.")
  (seed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <IK_Solve-request>) ostream)
  "Serializes a message object of type '<IK_Solve-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'position))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'orientation))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'seed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'seed))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <IK_Solve-request>) istream)
  "Deserializes a message object of type '<IK_Solve-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:setf (cl:slot-value msg 'position) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'position)))
    (cl:dotimes (i 3)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'orientation) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'orientation)))
    (cl:dotimes (i 3)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'seed) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'seed)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<IK_Solve-request>)))
  "Returns string type for a service object of type '<IK_Solve-request>"
  "itr_rpc/IK_SolveRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'IK_Solve-request)))
  "Returns string type for a service object of type 'IK_Solve-request"
  "itr_rpc/IK_SolveRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<IK_Solve-request>)))
  "Returns md5sum for a message object of type '<IK_Solve-request>"
  "39b92dc189c60778ee4cbbd09d427326")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'IK_Solve-request)))
  "Returns md5sum for a message object of type 'IK_Solve-request"
  "39b92dc189c60778ee4cbbd09d427326")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<IK_Solve-request>)))
  "Returns full string definition for message of type '<IK_Solve-request>"
  (cl:format cl:nil "# Header must contain time stamp~%Header header~%~%# Target position (x, y, z)~%float32[3] position~%# Target orientation (roll, pitch, yaw)~%float32[3] orientation~%~%# Seed values for the IK solver~%# Can be empty -> single random value for all joints~%# Can be the number of joints -> specific value for each joint~%float32[] seed~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'IK_Solve-request)))
  "Returns full string definition for message of type 'IK_Solve-request"
  (cl:format cl:nil "# Header must contain time stamp~%Header header~%~%# Target position (x, y, z)~%float32[3] position~%# Target orientation (roll, pitch, yaw)~%float32[3] orientation~%~%# Seed values for the IK solver~%# Can be empty -> single random value for all joints~%# Can be the number of joints -> specific value for each joint~%float32[] seed~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <IK_Solve-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'position) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'orientation) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'seed) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <IK_Solve-request>))
  "Converts a ROS message object to a list"
  (cl:list 'IK_Solve-request
    (cl:cons ':header (header msg))
    (cl:cons ':position (position msg))
    (cl:cons ':orientation (orientation msg))
    (cl:cons ':seed (seed msg))
))
;//! \htmlinclude IK_Solve-response.msg.html

(cl:defclass <IK_Solve-response> (roslisp-msg-protocol:ros-message)
  ((configuration
    :reader configuration
    :initarg :configuration
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass IK_Solve-response (<IK_Solve-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <IK_Solve-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'IK_Solve-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name itr_rpc-srv:<IK_Solve-response> is deprecated: use itr_rpc-srv:IK_Solve-response instead.")))

(cl:ensure-generic-function 'configuration-val :lambda-list '(m))
(cl:defmethod configuration-val ((m <IK_Solve-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader itr_rpc-srv:configuration-val is deprecated.  Use itr_rpc-srv:configuration instead.")
  (configuration m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <IK_Solve-response>) ostream)
  "Serializes a message object of type '<IK_Solve-response>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <IK_Solve-response>) istream)
  "Deserializes a message object of type '<IK_Solve-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<IK_Solve-response>)))
  "Returns string type for a service object of type '<IK_Solve-response>"
  "itr_rpc/IK_SolveResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'IK_Solve-response)))
  "Returns string type for a service object of type 'IK_Solve-response"
  "itr_rpc/IK_SolveResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<IK_Solve-response>)))
  "Returns md5sum for a message object of type '<IK_Solve-response>"
  "39b92dc189c60778ee4cbbd09d427326")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'IK_Solve-response)))
  "Returns md5sum for a message object of type 'IK_Solve-response"
  "39b92dc189c60778ee4cbbd09d427326")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<IK_Solve-response>)))
  "Returns full string definition for message of type '<IK_Solve-response>"
  (cl:format cl:nil "~%# Return possible configuration for reaching position~%float32[] configuration~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'IK_Solve-response)))
  "Returns full string definition for message of type 'IK_Solve-response"
  (cl:format cl:nil "~%# Return possible configuration for reaching position~%float32[] configuration~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <IK_Solve-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'configuration) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <IK_Solve-response>))
  "Converts a ROS message object to a list"
  (cl:list 'IK_Solve-response
    (cl:cons ':configuration (configuration msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'IK_Solve)))
  'IK_Solve-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'IK_Solve)))
  'IK_Solve-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'IK_Solve)))
  "Returns string type for a service object of type '<IK_Solve>"
  "itr_rpc/IK_Solve")