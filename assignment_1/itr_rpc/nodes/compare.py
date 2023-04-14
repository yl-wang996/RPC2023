#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import rospy
from sensor_msgs.msg import JointState
from math import pi

class Compare:
    def __init__(self):
        # Initialize node
        rospy.init_node('joint_state_publisher')
        self.pub = rospy.Publisher('joint_states', JointState, queue_size=10)

        rospy.Subscriber("/joint_states", JointState, self._callback_joint_state)

        # Initialize variables
        self.names = ['shoulder_pan_joint', 'shoulder_lift_joint','elbow_joint', 'wrist_1_joint', 'wrist_2_joint', 'wrist_3_joint' ]
        self.jointValues = [0, 0, 0, 0, 0, 0]
        self.main()

    def publishJointState(self, input):
        joint_state = JointState()
        joint_state.header.stamp = rospy.Time.now()
        joint_state.name = self.names
        joint_state.position = [input[0] + pi, input[1], input[2], input[3], input[4], input[5]]
        self.pub.publish(joint_state)

    def _callback_joint_state(self, data):
        if data.name != self.names:
            self.jointValues = data.position
        #rospy.loginfo(data.position)

    def main(self):
        r = rospy.Rate(10)
        while not rospy.is_shutdown():
            self.publishJointState(self.jointValues)
            r.sleep()

if __name__ == '__main__':
        try:
            Compare()
        except rospy.ROSInterruptException:
            pass
