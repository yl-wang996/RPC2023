;; Auto-generated. Do not edit!


(when (boundp 'itr_rpc::LineCollision)
  (if (not (find-package "ITR_RPC"))
    (make-package "ITR_RPC"))
  (shadow 'LineCollision (find-package "ITR_RPC")))
(unless (find-package "ITR_RPC::LINECOLLISION")
  (make-package "ITR_RPC::LINECOLLISION"))
(unless (find-package "ITR_RPC::LINECOLLISIONREQUEST")
  (make-package "ITR_RPC::LINECOLLISIONREQUEST"))
(unless (find-package "ITR_RPC::LINECOLLISIONRESPONSE")
  (make-package "ITR_RPC::LINECOLLISIONRESPONSE"))

(in-package "ROS")

(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))




(defclass itr_rpc::LineCollisionRequest
  :super ros::object
  :slots (_header _start _goal ))

(defmethod itr_rpc::LineCollisionRequest
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:start __start) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:goal __goal) (make-array 3 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _header __header)
   (setq _start __start)
   (setq _goal __goal)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:start
   (&optional __start)
   (if __start (setq _start __start)) _start)
  (:goal
   (&optional __goal)
   (if __goal (setq _goal __goal)) _goal)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32[3] _start
    (* 4    3)
    ;; float32[3] _goal
    (* 4    3)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32[3] _start
     (dotimes (i 3)
       (sys::poke (elt _start i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[3] _goal
     (dotimes (i 3)
       (sys::poke (elt _goal i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32[3] _start
   (dotimes (i (length _start))
     (setf (elt _start i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32[3] _goal
   (dotimes (i (length _goal))
     (setf (elt _goal i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;;
   self)
  )

(defclass itr_rpc::LineCollisionResponse
  :super ros::object
  :slots (_free ))

(defmethod itr_rpc::LineCollisionResponse
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

(defclass itr_rpc::LineCollision
  :super ros::object
  :slots ())

(setf (get itr_rpc::LineCollision :md5sum-) "707cbc39d27f203bc82c3dbe5b190730")
(setf (get itr_rpc::LineCollision :datatype-) "itr_rpc/LineCollision")
(setf (get itr_rpc::LineCollision :request) itr_rpc::LineCollisionRequest)
(setf (get itr_rpc::LineCollision :response) itr_rpc::LineCollisionResponse)

(defmethod itr_rpc::LineCollisionRequest
  (:response () (instance itr_rpc::LineCollisionResponse :init)))

(setf (get itr_rpc::LineCollisionRequest :md5sum-) "707cbc39d27f203bc82c3dbe5b190730")
(setf (get itr_rpc::LineCollisionRequest :datatype-) "itr_rpc/LineCollisionRequest")
(setf (get itr_rpc::LineCollisionRequest :definition-)
      "# Header must contain time stamp
Header header

# Target line between two points start and goal
float32[3] start
float32[3] goal


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

# Return true if configuration is possible (grid cells on the line unoccupied)
bool free
")

(setf (get itr_rpc::LineCollisionResponse :md5sum-) "707cbc39d27f203bc82c3dbe5b190730")
(setf (get itr_rpc::LineCollisionResponse :datatype-) "itr_rpc/LineCollisionResponse")
(setf (get itr_rpc::LineCollisionResponse :definition-)
      "# Header must contain time stamp
Header header

# Target line between two points start and goal
float32[3] start
float32[3] goal


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

# Return true if configuration is possible (grid cells on the line unoccupied)
bool free
")



(provide :itr_rpc/LineCollision "707cbc39d27f203bc82c3dbe5b190730")


