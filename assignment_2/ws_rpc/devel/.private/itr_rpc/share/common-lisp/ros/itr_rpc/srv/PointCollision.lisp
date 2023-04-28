; Auto-generated. Do not edit!


(cl:in-package itr_rpc-srv)


;//! \htmlinclude PointCollision-request.msg.html

(cl:defclass <PointCollision-request> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (position
    :reader position
    :initarg :position
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass PointCollision-request (<PointCollision-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PointCollision-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PointCollision-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name itr_rpc-srv:<PointCollision-request> is deprecated: use itr_rpc-srv:PointCollision-request instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <PointCollision-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader itr_rpc-srv:header-val is deprecated.  Use itr_rpc-srv:header instead.")
  (header m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <PointCollision-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader itr_rpc-srv:position-val is deprecated.  Use itr_rpc-srv:position instead.")
  (position m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PointCollision-request>) ostream)
  "Serializes a message object of type '<PointCollision-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'position))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PointCollision-request>) istream)
  "Deserializes a message object of type '<PointCollision-request>"
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
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PointCollision-request>)))
  "Returns string type for a service object of type '<PointCollision-request>"
  "itr_rpc/PointCollisionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PointCollision-request)))
  "Returns string type for a service object of type 'PointCollision-request"
  "itr_rpc/PointCollisionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PointCollision-request>)))
  "Returns md5sum for a message object of type '<PointCollision-request>"
  "c20cdc77e4139edffff4d2a510fde4fb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PointCollision-request)))
  "Returns md5sum for a message object of type 'PointCollision-request"
  "c20cdc77e4139edffff4d2a510fde4fb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PointCollision-request>)))
  "Returns full string definition for message of type '<PointCollision-request>"
  (cl:format cl:nil "# Header must contain time stamp~%Header header~%~%# Target position~%float32[3] position~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PointCollision-request)))
  "Returns full string definition for message of type 'PointCollision-request"
  (cl:format cl:nil "# Header must contain time stamp~%Header header~%~%# Target position~%float32[3] position~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PointCollision-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'position) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PointCollision-request>))
  "Converts a ROS message object to a list"
  (cl:list 'PointCollision-request
    (cl:cons ':header (header msg))
    (cl:cons ':position (position msg))
))
;//! \htmlinclude PointCollision-response.msg.html

(cl:defclass <PointCollision-response> (roslisp-msg-protocol:ros-message)
  ((free
    :reader free
    :initarg :free
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass PointCollision-response (<PointCollision-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PointCollision-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PointCollision-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name itr_rpc-srv:<PointCollision-response> is deprecated: use itr_rpc-srv:PointCollision-response instead.")))

(cl:ensure-generic-function 'free-val :lambda-list '(m))
(cl:defmethod free-val ((m <PointCollision-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader itr_rpc-srv:free-val is deprecated.  Use itr_rpc-srv:free instead.")
  (free m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PointCollision-response>) ostream)
  "Serializes a message object of type '<PointCollision-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'free) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PointCollision-response>) istream)
  "Deserializes a message object of type '<PointCollision-response>"
    (cl:setf (cl:slot-value msg 'free) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PointCollision-response>)))
  "Returns string type for a service object of type '<PointCollision-response>"
  "itr_rpc/PointCollisionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PointCollision-response)))
  "Returns string type for a service object of type 'PointCollision-response"
  "itr_rpc/PointCollisionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PointCollision-response>)))
  "Returns md5sum for a message object of type '<PointCollision-response>"
  "c20cdc77e4139edffff4d2a510fde4fb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PointCollision-response)))
  "Returns md5sum for a message object of type 'PointCollision-response"
  "c20cdc77e4139edffff4d2a510fde4fb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PointCollision-response>)))
  "Returns full string definition for message of type '<PointCollision-response>"
  (cl:format cl:nil "~%# Return true if configuration is possible (grid cell unoccupied)~%bool free~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PointCollision-response)))
  "Returns full string definition for message of type 'PointCollision-response"
  (cl:format cl:nil "~%# Return true if configuration is possible (grid cell unoccupied)~%bool free~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PointCollision-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PointCollision-response>))
  "Converts a ROS message object to a list"
  (cl:list 'PointCollision-response
    (cl:cons ':free (free msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'PointCollision)))
  'PointCollision-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'PointCollision)))
  'PointCollision-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PointCollision)))
  "Returns string type for a service object of type '<PointCollision>"
  "itr_rpc/PointCollision")