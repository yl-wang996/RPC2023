#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# Example script for Forward Kinematics Control with IK Solving

import rospy # Import ROS Framework

from itr_rpc.msg import FK_Control # Import ROS message definition for FK Control
# Import ROS message defintion for IK Solving Service with Request and Response message
from itr_rpc.srv import IK_SolveRequest, IK_SolveResponse, IK_Solve

# Function for publisher
def talker():
    # Initialize publisher
    pub = rospy.Publisher('fk_control', FK_Control, queue_size=1)
    # Initialize Service
    rospy.wait_for_service('IK_Solve')
    # Initialize node
    rospy.init_node('ik_control')
    # Set control rate to 100 Hz
    r = rospy.Rate(100)

    # Create FK Control message
    joint_control = FK_Control()

    # Main Loop
    while not rospy.is_shutdown():
        # Try/Except structure in case service call fails
        try:
            ik_service_proxy = rospy.ServiceProxy('IK_Solve', IK_Solve) # Create service proxy
            ik_request = IK_SolveRequest() # Create IK Solve request
            # Fill data fields of message
            ik_request.position = [1,1,0.05]
            ik_request.orientation = [0,0,0]
            ik_request.seed = []
            ik_response = ik_service_proxy(ik_request) # Send request and store response

            joint_control.header.stamp = rospy.Time.now() # Set message time stamp
            joint_control.configuration = ik_response.configuration # Fill data field of message
            pub.publish(joint_control) # Publish message
        # Throw exception
        except rospy.ServiceException,e :
            rospy.logerr(e)
        r.sleep() # Sleep until 100 Hz loop is met

# Main function called when launching Python script
if __name__ == '__main__':
    # Try to create the Publisher, end if exception thrown
    try:
        talker()
    except rospy.ROSInterruptException:
        pass
