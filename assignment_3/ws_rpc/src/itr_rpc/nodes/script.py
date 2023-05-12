#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# Script for Kinematic Control

import rospy

def talker():
    rospy.init_node('kinematic_control')

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass
