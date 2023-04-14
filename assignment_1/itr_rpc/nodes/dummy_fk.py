#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# Example script for Forward Kinematics Control

import rospy  # Import ROS Framework
from math import pi  # Import PI number

from itr_rpc.msg import FK_Control  # Import ROS message definition for FK Control

# Function for publisher


def talker():
    # Initialize publisher
    pub = rospy.Publisher('fk_control', FK_Control, queue_size=1)
    # Initialize node
    rospy.init_node('fk_control')
    # Set control rate to 100 Hz
    r = rospy.Rate(100)

    # Create FK Control message
    joint_control = FK_Control()

    # Main Loop
    while not rospy.is_shutdown():
        joint_control.header.stamp = rospy.Time.now()  # Set message time stamp
        rad = rospy.get_time() % (2 * pi) - pi  # Create data
        joint_control.configuration = [rad, -2*rad]  # Fill data field of message
        pub.publish(joint_control)  # Publish message
        r.sleep()  # Sleep until 100 Hz loop is met


# Main function called when launching Python script
if __name__ == '__main__':
    # Try to create the Publisher, end if exception thrown
    try:
        talker()
    except rospy.ROSInterruptException:
        pass
