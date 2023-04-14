cmake_minimum_required(VERSION 2.8.3)
project(itr_rpc)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  sensor_msgs
  visualization_msgs
  std_msgs
  tf
  message_generation
  urdfdom_py
  dynamic_reconfigure
  map_server
  trac_ik_python
)

 catkin_python_setup()

################################################
## Declare ROS messages, services and actions ##
################################################

## Generate messages in the 'msg' folder
add_message_files(
   FILES
   FK_Control.msg

 )

## Generate services in the 'srv' folder
 add_service_files(
   FILES
   IK_Solve.srv
   PointCollision.srv
   LineCollision.srv
 )

## Generate added messages and services with any dependencies listed here
generate_messages(
  DEPENDENCIES
  std_msgs
  nav_msgs
  visualization_msgs
)

################################################
## Declare ROS dynamic reconfigure parameters ##
################################################

## Generate dynamic reconfigure parameters in the 'cfg' folder
 generate_dynamic_reconfigure_options(
   cfg/KinematicsConfig.cfg
 )
catkin_package(
CATKIN_DEPENDS roscpp rospy sensor_msgs std_msgs tf message_runtime dynamic_reconfigure
)
## Mark executable scripts (Python etc.) for installation
## in contrast to setup.py, you can choose the destination
 install(PROGRAMS
   nodes/compare.py
   nodes/kinematics_controller.py
   nodes/dummy_fk.py
   nodes/dummy_ik.py
   nodes/script.py
   DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
 )
