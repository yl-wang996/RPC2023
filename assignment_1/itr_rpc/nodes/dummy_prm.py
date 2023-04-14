#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# Example script for PRM and Forward Kinematics Control

import rospy # Import ROS Framework
import math # Import PI number and other math functions
import sys

from itr_rpc.msg import FK_Control # Import ROS message definition for FK Control
from std_msgs.msg import Empty # Import ROS message definition Empty messages
from geometry_msgs.msg import Point # Import ROS message defintion for Point
from visualization_msgs.msg import Marker # Import ROS message definition for Marker
# Import ROS message defintion for Collision Checking Service with Request and Response message
from itr_rpc.srv import PointCollision, PointCollisionResponse, PointCollisionRequest, LineCollision, LineCollisionResponse, LineCollisionRequest

import numpy # do things with math
import networkx

# ----------------------- Helper functions and classes -------------------------
# There is no need to touch these, however you may if it benefits you.

### Represent a 2D point.
class Point2D:
    def __repr__(self):
        return "Point2D()"
    def __str__(self):
        return "("+str(self.x)+","+str(self.y)+","+str(self.z)+")"
    def __init__(self,x,y):
        self.x=x
        self.y=y
        self.z=0
        self.position=[self.x,self.y,self.z]

### Represent a 2D line, consisting of two 2D points with a length attribute.
class Line2D:
    def __init__(self,start,end):
        self.start=start
        self.end=end
        self.length=math.hypot(self.end.x-self.start.x, self.end.y-self.start.y)
    def __repr__(self):
        return "Line2D()"
    def __str__(self):
        return str(self.start)+"---"+str(self.end)

### Draw the solution path with a thick blue line.
### Expects a list of waypoints as input, not the interpolated path.
def show_solution(path_in_free_space):
    rospy.loginfo("Drawing solution")
    solution_pub = rospy.Publisher('/marker', Marker, queue_size=1, latch=True)
    # Initialize line marker
    solution_marker = Marker()
    solution_marker.header.stamp = rospy.Time.now()
    solution_marker.header.frame_id = "map"
    solution_marker.ns = "prm_solution"
    solution_marker.id = 0
    solution_marker.type = Marker.LINE_STRIP
    solution_marker.action = Marker.ADD
    solution_marker.pose.orientation.x = 0
    solution_marker.pose.orientation.y = 0
    solution_marker.pose.orientation.z = 0
    solution_marker.pose.orientation.w = 1
    solution_marker.scale.x = 0.05
    solution_marker.scale.y = 0.05
    solution_marker.scale.z = 0.05
    solution_marker.color.r = 0
    solution_marker.color.g = 0
    solution_marker.color.b = 1
    solution_marker.color.a = 1
    solution_marker.lifetime.secs = 0
    for point in path_in_free_space:
        rospy.loginfo("    " + str(point))
        path_point = Point()
        path_point.x = point.x
        path_point.y = point.y
        path_point.z = point.z
        solution_marker.points.append(path_point)
    solution_pub.publish(solution_marker)

### Interpolate the waypoints into a trajectory which can be executed.
### Adjust the speed factor such that the robot moves fast but does not skip.
### Smaller factor is faster, larger is slower.
def interpolate_path(path_in_free_space):
    interpolated_path = []
    for i in range(len(path_in_free_space)-1):
        begin = path_in_free_space[i]
        end = path_in_free_space[i+1]
        speed_factor = 150
        step_count = int(math.hypot(end.x-begin.x, end.y-begin.y)*speed_factor)
        interpolated_path.extend(zip(numpy.linspace(begin.x, end.x, step_count+1), numpy.linspace(begin.y, end.y, step_count+1)))
    return interpolated_path

### Move the robot to from start to end
def move_robot(shortest_path):
    fk_pub = rospy.Publisher('/fk_control', FK_Control, queue_size=1)
    # Set control rate to 100 Hz
    r = rospy.Rate(100)
    # Create FK Control message to move robot
    joint_control = FK_Control()
    interpolated_path = interpolate_path(shortest_path) # Interpolate path for smooth trajectory
    rospy.loginfo("Driving path with %s waypoints", len(interpolated_path))
    while not rospy.is_shutdown():
        joint_control.header.stamp = rospy.Time.now() # Set message time stamp
        if len(interpolated_path) != 0: # While there is a waypoint left, get the next element
            joint_target = interpolated_path.pop(0)
        else:
            return 0
        joint_control.configuration = [joint_target[0], joint_target[1]] # Fill data field of message
        fk_pub.publish(joint_control) # Publish message
        r.sleep() # Sleep until 100 Hz loop is met

# ------------------------------ Your functions --------------------------------
# Use this structure to speed up writing your own software.
# Adapt the parts which do not have logic themselves yet.

### Function to generate path in free space
def PRM_Path_Planner():
    # Initialize publisher
    reset_pub = rospy.Publisher("/reset_to_start", Empty, queue_size=1, latch=True)
    # Initialize Services
    rospy.wait_for_service('Point_Collision_Check')
    rospy.wait_for_service('Line_Collision_Check')
    # Initialize node
    rospy.init_node('fk_control')
    global_start_time = rospy.Time.now().to_sec()

    # Clear all markers from previous run
    rospy.loginfo("Cleaning map...")
    rospy.sleep(.2)
    clear_marker_pub = rospy.Publisher('marker', Marker, queue_size=1, latch=True)
    clear_marker = Marker()
    clear_marker.header.stamp = rospy.Time.now()
    clear_marker.header.frame_id = "map"
    clear_marker.ns = "prm_lines"
    clear_marker.action = Marker.DELETEALL
    clear_marker_pub.publish(clear_marker)
    clear_marker.ns = "prm_points"
    clear_marker_pub.publish(clear_marker)
    rospy.sleep(.2)
    rospy.loginfo("Cleaned map...")

    # Drive to start position
    rospy.sleep(2) # FIXME: remove this
    rospy.loginfo("Resetting to start position")
    reset_pub.publish(Empty())
    rospy.sleep(2) # FIXME: remove this

    # Set up list of points and lines
    points = []
    free_points = []
    lines = []
    free_lines = []

    # Define start and goal position # FIXME: This must be changed
    path_start = Point2D(1,0)
    path_goal = Point2D(-1,-1)
    points.append(path_start)
    points.append(path_goal)

    # Set up points for PRM # FIXME: This must be changed
    point = Point2D(1,-1)
    points.append(point)

    # Perform PRM Collision checks

    # Test points for collision
    rospy.loginfo("Checking %s Points", len(points))
    point_collision_proxy = rospy.ServiceProxy('Point_Collision_Check', PointCollision) # Create service proxy

    point_request = PointCollisionRequest() # Create Point Collision request message
    # Fill data fields of message
    rospy.sleep(1) # FIXME: remove this
    for point in points:
        point_request.position = point.position
        # Try/Except structure in case service call fails
        try:
            point_response = point_collision_proxy(point_request) # Send request and store response
        except rospy.ServiceException as e:
            rospy.logerr(e)
            sys.exit()
        if point_response.free:
            free_points.append(point.position)
        rospy.sleep(1) # FIXME: remove this

    rospy.sleep(3) # FIXME: remove this
    rospy.loginfo("Creating List of Lines from %s free Points", len(free_points))

    # Create a List of lines from the points with all possible combinations
    # FIXME: Only use free points
    lines.append(Line2D(path_start,point))
    lines.append(Line2D(path_start,path_goal))
    lines.append(Line2D(point,path_goal))

    # Test lines for collision
    rospy.sleep(3) # FIXME: remove this
    rospy.loginfo("Checking %s Lines", len(lines))
    line_collision_proxy = rospy.ServiceProxy('Line_Collision_Check', LineCollision) # Create service proxy

    line_request = LineCollisionRequest() # Create Line Collision request
    # Fill data fields of message
    rospy.sleep(1) # FIXME: remove this
    for line in lines:
        line_request.start = line.start.position
        line_request.goal = line.end.position
        # Try/Except structure in case service call fails
        try:
            line_response = line_collision_proxy(line_request) # Send request and store response
        except rospy.ServiceException as e:
            rospy.logerr(e)
            sys.exit()
        if line_response.free:
            free_lines.append(line_request)
        rospy.sleep(1) # FIXME: remove this

    # FIXME: Create graph and find valid path
    rospy.sleep(2) # FIXME: remove this
    rospy.loginfo("Creating Graph from %s collision-free Lines", len(free_lines))
    free_graph = networkx.Graph()
    #free_graph.add_edge(path_start,point)
    #free_graph.add_edge(point,path_goal)

    rospy.sleep(2) # FIXME: remove this
    #rospy.loginfo("Graph contains %s nodes and %s edges", free_graph.number_of_nodes(), free_graph.number_of_edges())
    try:
        shortest_path = [path_start, point, path_goal]
        show_solution(shortest_path)
        rospy.loginfo("Found a path after %s seconds", rospy.Time.now().to_sec()-global_start_time)
    except:
        rospy.logerr("Could not find and draw shortest path")
        return 0

    # Move the robot
    move_robot(shortest_path)
    rospy.loginfo("Arrived at goal after %s seconds", rospy.Time.now().to_sec()-global_start_time) # Hurray, we are there

# Main function called when launching Python script
if __name__ == '__main__':
    # Try to create the Publisher, end if exception thrown
    try:
        PRM_Path_Planner()
    except rospy.ROSInterruptException:
        pass
