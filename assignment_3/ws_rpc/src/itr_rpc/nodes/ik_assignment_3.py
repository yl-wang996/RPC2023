#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# Example script for Forward Kinematics Control with IK Solving

import rospy # Import ROS Framework

from itr_rpc.msg import FK_Control # Import ROS message definition for FK Control
# Import ROS message defintion for IK Solving Service with Request and Response message
from itr_rpc.srv import IK_SolveRequest, IK_SolveResponse, IK_Solve
import numpy as np
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

    # # Main Loop
    # while not rospy.is_shutdown():
    #     # Try/Except structure in case service call fails
    #     try:
    #         ik_service_proxy = rospy.ServiceProxy('IK_Solve', IK_Solve) # Create service proxy
    #         ik_request = IK_SolveRequest() # Create IK Solve request
    #         # Fill data fields of message
    #         ik_request.position = [0.3,0.2,0.05]
    #         ik_request.orientation = [0,0,0]
    #         ik_request.seed = []
    #         ik_response = ik_service_proxy(ik_request) # Send request and store response

    #         joint_control.header.stamp = rospy.Time.now() # Set message time stamp
    #         joint_control.configuration = ik_response.configuration # Fill data field of message
    #         pub.publish(joint_control) # Publish message
    #     # Throw exception
    #     except rospy.ServiceException as e :
    #         rospy.logerr(e)
    #     r.sleep() # Sleep until 100 Hz loop is met
    def send_position(position, step):
        for _ in range(step):
            r.sleep()
            try:
                ik_service_proxy = rospy.ServiceProxy('IK_Solve', IK_Solve) # Create service proxy
                ik_request = IK_SolveRequest() # Create IK Solve request
                # Fill data fields of message
                ik_request.position = position
                ik_request.orientation = [0,0,0]
                ik_request.seed = []
                ik_response = ik_service_proxy(ik_request) # Send request and store response

                joint_control.header.stamp = rospy.Time.now() # Set message time stamp
                joint_control.configuration = ik_response.configuration # Fill data field of message
                pub.publish(joint_control) # Publish message
                # Throw exception
            except rospy.ServiceException as e :
                rospy.logerr(e)




    rospy.sleep(1)

    # positions = [[-0.38,-0.575, 0],[-0.38,0.195,0],[0,0.7,0],[0.38,0.195,0],[0.38,-0.575, 0]]
    positions = [[-0.38,0.195,0],[0,0.7,0],[0.38,0.195,0],[0.38,-0.575, 0],[-0.38,-0.575, 0]]
    all_interpolated_positions = []
    for idx in range(len(positions)-1):
        interpolated_positions = np.linspace(positions[idx],stop=positions[idx+1],num=50).tolist()
        all_interpolated_positions+=interpolated_positions





    send_position(position=positions[0],step=200)

    for position in all_interpolated_positions[1:]:
        send_position(position=position,step=10)
            # Try/Except structure in case service call fails



            
    
    


# Main function called when launching Python script
if __name__ == '__main__':
    # Try to create the Publisher, end if exception thrown
    try:
        talker()
    except rospy.ROSInterruptException:
        pass
