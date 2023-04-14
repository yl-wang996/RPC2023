+++ ros_kinetic_trac_ik needs to be installed +++

* Sign in with Informatik-Kennung
'8example'

* Add following lines to ~/.bashrc:

source /opt/ros/melodic/setup.bash
source ~/ros_ws/devel/setup.bash

* Create and build a catkin workspace:

$ mkdir -p ~/ros_ws/src
$ cd ~/ros_ws/
$ catkin build

Further information: http://wiki.ros.org/ROS/Tutorials/InstallingandConfiguringROSEnvironment

* Clone project
$ cd ~/ros_ws/src/
$ git clone https://git.mafiasi.de/jonetzko/itr_rpc.git
'18example'

* Build project
$ cd ~/ros_ws/
$ catkin build

* [new terminal] $roslaunch itr_rpc display.launch
with correct model

* Edit ~/ros_ws/src/itr_rpc/nodes/joint_controller.py
with correct amount of joints and values between joint limits

* [new terminal] $roslaunch itr_rpc student.launch

* Kill and restart student.launch

* rosrun rqt_reconfigure rqt_reconfigure