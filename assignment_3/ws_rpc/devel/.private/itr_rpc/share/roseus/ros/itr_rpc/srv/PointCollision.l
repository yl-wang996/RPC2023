;; Auto-generated. Do not edit!


(when (boundp 'itr_rpc::PointCollision)
  (if (not (find-package "ITR_RPC"))
    (make-package "ITR_RPC"))
  (shadow 'PointCollision (find-package "ITR_RPC")))
(unless (find-package "ITR_RPC::POINTCOLLISION")
  (make-package "ITR_RPC::POINTCOLLISION"))
(unless (find-package "ITR_RPC::POINTCOLLISIONREQUEST")
  (make-package "ITR_RPC::POINTCOLLISIONREQUEST"))
(unless (find-package "ITR_RPC::POINTCOLLISIONRESPONSE")
  (make-package "ITR_RPC::POINTCOLLISIONRESPONSE"))

(in-package "ROS")

(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))




(defclass itr_rpc::PointCollisionRequest
  :super ros::object
  :slots (_header _position ))

(defmethod itr_rpc::PointCollisionRequest
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:position __position) (make-array 3 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _header __header)
   (setq _position __position)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32[3] _position
    (* 4    3)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32[3] _position
     (dotimes (i 3)
       (sys::poke (elt _position i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32[3] _position
   (dotimes (i (length _position))
     (setf (elt _position i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;;
   self)
  )

(defclass itr_rpc::PointCollisionResponse
  :super ros::object
  :slots (_free ))

(defmethod itr_rpc::PointCollisionResponse
  (:init
   (&key
    ((:free __free) nil)
    )
   (send-super :init)
   (setq _free __free)
   self)
  (:free
   (&optional (__free :null))
   (if (not (eq __free :null)) (setq _free __free)) _free)
  (:serialization-length
   ()
   (+
    ;; bool _free
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _free
       (if _free (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _free
     (setq _free (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass itr_rpc::PointCollision
  :super ros::object
  :slots ())

(setf (get itr_rpc::PointCollision :md5sum-) "c20cdc77e4139edffff4d2a510fde4fb")
(setf (get itr_rpc::PointCollision :datatype-) "itr_rpc/PointCollision")
(setf (get itr_rpc::PointCollision :request) itr_rpc::PointCollisionRequest)
(setf (get itr_rpc::PointCollision :response) itr_rpc::PointCollisionResponse)

(defmethod itr_rpc::PointCollisionRequest
  (:response () (instance itr_rpc::PointCollisionResponse :init)))

(setf (get itr_rpc::PointCollisionRequest :md5sum-) "c20cdc77e4139edffff4d2a510fde4fb")
(setf (get itr_rpc::PointCollisionRequest :datatype-) "itr_rpc/PointCollisionRequest")
(setf (get itr_rpc::PointCollisionRequest :definition-)
      "# Header must contain time stamp
Header header

# Target position
float32[3] position


================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id
---

# Return true if configuration is possible (grid cell unoccupied)
bool free
")

(setf (get itr_rpc::PointCollisionResponse :md5sum-) "c20cdc77e4139edffff4d2a510fde4fb")
(setf (get itr_rpc::PointCollisionResponse :datatype-) "itr_rpc/PointCollisionResponse")
(setf (get itr_rpc::PointCollisionResponse :definition-)
      "# Header must contain time stamp
Header header

# Target position
float32[3] position


================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id
---

# Return true if configuration is possible (grid cell unoccupied)
bool free
")



(provide :itr_rpc/PointCollision "c20cdc77e4139edffff4d2a510fde4fb")


