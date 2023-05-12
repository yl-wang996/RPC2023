; Auto-generated. Do not edit!


(cl:in-package itr_rpc-srv)


;//! \htmlinclude LineCollision-request.msg.html

(cl:defclass <LineCollision-request> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (start
    :reader start
    :initarg :start
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0))
   (goal
    :reader goal
    :initarg :goal
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass LineCollision-request (<LineCollision-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LineCollision-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LineCollision-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name itr_rpc-srv:<LineCollision-request> is deprecated: use itr_rpc-srv:LineCollision-request instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <LineCollision-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader itr_rpc-srv:header-val is deprecated.  Use itr_rpc-srv:header instead.")
  (header m))

(cl:ensure-generic-function 'start-val :lambda-list '(m))
(cl:defmethod start-val ((m <LineCollision-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader itr_rpc-srv:start-val is deprecated.  Use itr_rpc-srv:start instead.")
  (start m))

(cl:ensure-generic-function 'goal-val :lambda-list '(m))
(cl:defmethod goal-val ((m <LineCollision-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader itr_rpc-srv:goal-val is deprecated.  Use itr_rpc-srv:goal instead.")
  (goal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LineCollision-request>) ostream)
  "Serializes a message object of type '<LineCollision-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'start))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'goal))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LineCollision-request>) istream)
  "Deserializes a message object of type '<LineCollision-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:setf (cl:slot-value msg 'start) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'start)))
    (cl:dotimes (i 3)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'goal) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'goal)))
    (cl:dotimes (i 3)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LineCollision-request>)))
  "Returns string type for a service object of type '<LineCollision-request>"
  "itr_rpc/LineCollisionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LineCollision-request)))
  "Returns string type for a service object of type 'LineCollision-request"
  "itr_rpc/LineCollisionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LineCollision-request>)))
  "Returns md5sum for a message object of type '<LineCollision-request>"
  "707cbc39d27f203bc82c3dbe5b190730")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LineCollision-request)))
  "Returns md5sum for a message object of type 'LineCollision-request"
  "707cbc39d27f203bc82c3dbe5b190730")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LineCollision-request>)))
  "Returns full string definition for message of type '<LineCollision-request>"
  (cl:format cl:nil "# Header must contain time stamp~%Header header~%~%# Target line between two points start and goal~%float32[3] start~%float32[3] goal~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LineCollision-request)))
  "Returns full string definition for message of type 'LineCollision-request"
  (cl:format cl:nil "# Header must contain time stamp~%Header header~%~%# Target line between two points start and goal~%float32[3] start~%float32[3] goal~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LineCollision-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'start) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'goal) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LineCollision-request>))
  "Converts a ROS message object to a list"
  (cl:list 'LineCollision-request
    (cl:cons ':header (header msg))
    (cl:cons ':start (start msg))
    (cl:cons ':goal (goal msg))
))
;//! \htmlinclude LineCollision-response.msg.html

(cl:defclass <LineCollision-response> (roslisp-msg-protocol:ros-message)
  ((free
    :reader free
    :initarg :free
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass LineCollision-response (<LineCollision-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LineCollision-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LineCollision-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name itr_rpc-srv:<LineCollision-response> is deprecated: use itr_rpc-srv:LineCollision-response instead.")))

(cl:ensure-generic-function 'free-val :lambda-list '(m))
(cl:defmethod free-val ((m <LineCollision-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader itr_rpc-srv:free-val is deprecated.  Use itr_rpc-srv:free instead.")
  (free m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LineCollision-response>) ostream)
  "Serializes a message object of type '<LineCollision-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'free) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LineCollision-response>) istream)
  "Deserializes a message object of type '<LineCollision-response>"
    (cl:setf (cl:slot-value msg 'free) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LineCollision-response>)))
  "Returns string type for a service object of type '<LineCollision-response>"
  "itr_rpc/LineCollisionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LineCollision-response)))
  "Returns string type for a service object of type 'LineCollision-response"
  "itr_rpc/LineCollisionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LineCollision-response>)))
  "Returns md5sum for a message object of type '<LineCollision-response>"
  "707cbc39d27f203bc82c3dbe5b190730")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LineCollision-response)))
  "Returns md5sum for a message object of type 'LineCollision-response"
  "707cbc39d27f203bc82c3dbe5b190730")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LineCollision-response>)))
  "Returns full string definition for message of type '<LineCollision-response>"
  (cl:format cl:nil "~%# Return true if configuration is possible (grid cells on the line unoccupied)~%bool free~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LineCollision-response)))
  "Returns full string definition for message of type 'LineCollision-response"
  (cl:format cl:nil "~%# Return true if configuration is possible (grid cells on the line unoccupied)~%bool free~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LineCollision-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LineCollision-response>))
  "Converts a ROS message object to a list"
  (cl:list 'LineCollision-response
    (cl:cons ':free (free msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'LineCollision)))
  'LineCollision-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'LineCollision)))
  'LineCollision-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LineCollision)))
  "Returns string type for a service object of type '<LineCollision>"
  "itr_rpc/LineCollision")