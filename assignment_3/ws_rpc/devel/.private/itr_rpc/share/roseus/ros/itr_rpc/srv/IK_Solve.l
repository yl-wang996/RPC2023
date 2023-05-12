;; Auto-generated. Do not edit!


(when (boundp 'itr_rpc::IK_Solve)
  (if (not (find-package "ITR_RPC"))
    (make-package "ITR_RPC"))
  (shadow 'IK_Solve (find-package "ITR_RPC")))
(unless (find-package "ITR_RPC::IK_SOLVE")
  (make-package "ITR_RPC::IK_SOLVE"))
(unless (find-package "ITR_RPC::IK_SOLVEREQUEST")
  (make-package "ITR_RPC::IK_SOLVEREQUEST"))
(unless (find-package "ITR_RPC::IK_SOLVERESPONSE")
  (make-package "ITR_RPC::IK_SOLVERESPONSE"))

(in-package "ROS")

(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))




(defclass itr_rpc::IK_SolveRequest
  :super ros::object
  :slots (_header _position _orientation _seed ))

(defmethod itr_rpc::IK_SolveRequest
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:position __position) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:orientation __orientation) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:seed __seed) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _header __header)
   (setq _position __position)
   (setq _orientation __orientation)
   (setq _seed __seed)
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
  (:orientation
   (&optional __orientation)
   (if __orientation (setq _orientation __orientation)) _orientation)
  (:seed
   (&optional __seed)
   (if __seed (setq _seed __seed)) _seed)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32[3] _position
    (* 4    3)
    ;; float32[3] _orientation
    (* 4    3)
    ;; float32[] _seed
    (* 4    (length _seed)) 4
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
     ;; float32[3] _orientation
     (dotimes (i 3)
       (sys::poke (elt _orientation i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _seed
     (write-long (length _seed) s)
     (dotimes (i (length _seed))
       (sys::poke (elt _seed i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
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
   ;; float32[3] _orientation
   (dotimes (i (length _orientation))
     (setf (elt _orientation i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32[] _seed
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _seed (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _seed i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass itr_rpc::IK_SolveResponse
  :super ros::object
  :slots (_configuration ))

(defmethod itr_rpc::IK_SolveResponse
  (:init
   (&key
    ((:configuration __configuration) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _configuration __configuration)
   self)
  (:configuration
   (&optional __configuration)
   (if __configuration (setq _configuration __configuration)) _configuration)
  (:serialization-length
   ()
   (+
    ;; float32[] _configuration
    (* 4    (length _configuration)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _configuration
     (write-long (length _configuration) s)
     (dotimes (i (length _configuration))
       (sys::poke (elt _configuration i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _configuration
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _configuration (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _configuration i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass itr_rpc::IK_Solve
  :super ros::object
  :slots ())

(setf (get itr_rpc::IK_Solve :md5sum-) "39b92dc189c60778ee4cbbd09d427326")
(setf (get itr_rpc::IK_Solve :datatype-) "itr_rpc/IK_Solve")
(setf (get itr_rpc::IK_Solve :request) itr_rpc::IK_SolveRequest)
(setf (get itr_rpc::IK_Solve :response) itr_rpc::IK_SolveResponse)

(defmethod itr_rpc::IK_SolveRequest
  (:response () (instance itr_rpc::IK_SolveResponse :init)))

(setf (get itr_rpc::IK_SolveRequest :md5sum-) "39b92dc189c60778ee4cbbd09d427326")
(setf (get itr_rpc::IK_SolveRequest :datatype-) "itr_rpc/IK_SolveRequest")
(setf (get itr_rpc::IK_SolveRequest :definition-)
      "# Header must contain time stamp
Header header

# Target position (x, y, z)
float32[3] position
# Target orientation (roll, pitch, yaw)
float32[3] orientation

# Seed values for the IK solver
# Can be empty -> single random value for all joints
# Can be the number of joints -> specific value for each joint
float32[] seed


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

# Return possible configuration for reaching position
float32[] configuration
")

(setf (get itr_rpc::IK_SolveResponse :md5sum-) "39b92dc189c60778ee4cbbd09d427326")
(setf (get itr_rpc::IK_SolveResponse :datatype-) "itr_rpc/IK_SolveResponse")
(setf (get itr_rpc::IK_SolveResponse :definition-)
      "# Header must contain time stamp
Header header

# Target position (x, y, z)
float32[3] position
# Target orientation (roll, pitch, yaw)
float32[3] orientation

# Seed values for the IK solver
# Can be empty -> single random value for all joints
# Can be the number of joints -> specific value for each joint
float32[] seed


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

# Return possible configuration for reaching position
float32[] configuration
")



(provide :itr_rpc/IK_Solve "39b92dc189c60778ee4cbbd09d427326")


