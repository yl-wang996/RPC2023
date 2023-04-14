#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import rospy
import tf_conversions
import math
import numpy as np
import tf2_ros
import geometry_msgs.msg
from dynamic_reconfigure.client import Client
from itr_rpc.cfg import KinematicsConfig
from nav_msgs.msg import OccupancyGrid
from visualization_msgs.msg import Marker, MarkerArray
from geometry_msgs.msg import Point
from sensor_msgs.msg import JointState
from std_msgs.msg import Empty
from itr_rpc.msg import FK_Control
from itr_rpc.srv import PointCollision, PointCollisionResponse, PointCollisionRequest, LineCollision, LineCollisionResponse, LineCollisionRequest
from threading import Thread
from collections import deque
from copy import copy, deepcopy

class CollisionService:
    def __init__(self):
        # Initialize node
        rospy.init_node('collision_service')
        # publish
        self.marker_array_pub = rospy.Publisher('/marker_array', MarkerArray, queue_size=10)
        self.marker_pub = rospy.Publisher('/marker', Marker, queue_size=10)
        self.fk_pub = rospy.Publisher('/fk_control', FK_Control, queue_size= 10)
        # reconfigure client
        self.dynreconfig_client = Client("kinematics_controller", timeout=5)
        # subscribe
        rospy.Subscriber("/map", OccupancyGrid, self._map_callback)
        rospy.Subscriber("/joint_states", JointState, self._callback_joint_states)
        rospy.Subscriber("/reset_to_start", Empty, self._callback_reset_to_start)
        # initialize robot position
        self.robotX = 0
        self.robotY = 0
        # service
        self.map_point_service = rospy.Service('Point_Collision_Check', PointCollision, self.map_point_srv)
        self.map_line_service = rospy.Service('Line_Collision_Check', LineCollision, self.map_line_srv)
        # flag for map
        self.mapReceived = False
        self.lines = rospy.get_param('~lines')
        # Initialize point marker
        self.point_marker = Marker()
        self.point_marker.header.frame_id = "map"
        self.point_marker.ns = "prm_points"
        self.point_marker.id = 0
        self.point_marker.type = Marker.SPHERE
        self.point_marker.action = Marker.ADD
        self.point_marker.pose.position.z = 0
        self.point_marker.pose.orientation.x = 1
        self.point_marker.pose.orientation.y = 0
        self.point_marker.pose.orientation.z = 0
        self.point_marker.pose.orientation.w = 0
        self.point_marker.scale.x = 0.05
        self.point_marker.scale.y = 0.05
        self.point_marker.scale.z = 0.05
        self.point_marker.color.b = 0
        self.point_marker.color.a = 1
        self.point_marker.lifetime.secs = 0
        # Initialize line marker
        self.line_marker = Marker()
        self.line_marker.header.stamp = rospy.Time.now()
        self.line_marker.header.frame_id = "map"
        self.line_marker.ns = "prm_lines"
        self.line_marker.id = 0
        self.line_marker.type = Marker.LINE_STRIP
        self.line_marker.action = Marker.ADD
        self.line_marker.pose.orientation.x = 0
        self.line_marker.pose.orientation.y = 0
        self.line_marker.pose.orientation.z = 0
        self.line_marker.pose.orientation.w = 1
        self.line_marker.scale.x = 0.01
        self.line_marker.scale.y = 0.01
        self.line_marker.scale.z = 0.01
        self.line_marker.color.b = 0
        self.line_marker.color.a = 1
        self.line_marker.lifetime.secs = 0
        # Initialize MarkerArray
        self.marker_array = MarkerArray()
        self.start_time = 0
        self.med_time = 0
        self.stop_time = 0
        self.point_time_calc = 0
        self.point_time_pub = 0
        self.line_time_calc = 0
        self.line_time_pub = 0
        self.point_marker_queue = deque()
        self.line_marker_queue = deque()
        self.marker_pub_thread = Thread(target=self.marker_pub_queue)
        self.marker_pub_thread.start()
        rospy.spin()

    def get_point_marker(self, x, y, free):
        self.point_marker.header.stamp = rospy.Time.now()
        self.point_marker.pose.position.x = x
        self.point_marker.pose.position.y = y
        if free:
            self.point_marker.color.r = 0
            self.point_marker.color.g = 1
            self.point_marker.lifetime.secs = 0
        else:
            self.point_marker.color.r = 1
            self.point_marker.color.g = 0
            self.point_marker.lifetime.secs = 30
        self.point_marker.id += 1
        return self.point_marker

    def get_line_marker(self, start_x, start_y, goal_x, goal_y, free):
        self.line_marker.header.stamp = rospy.Time.now()
        self.line_marker.points = []
        start_point = Point()
        start_point.x = start_x
        start_point.y = start_y
        start_point.z = 0
        goal_point = Point()
        goal_point.x = goal_x
        goal_point.y = goal_y
        goal_point.z = 0
        self.line_marker.points.append(start_point)
        self.line_marker.points.append(goal_point)
        if free:
            self.line_marker.color.r = 0
            self.line_marker.color.g = 1
            self.line_marker.lifetime.secs = 0
        else:
            self.line_marker.color.r = 1
            self.line_marker.color.g = 0
            self.line_marker.lifetime.secs = 5
        self.line_marker.id += 1
        return self.line_marker


    def _map_callback(self, data):
        self.map = data.data
        self.mapResolution = data.info.resolution
        self.mapWidth = data.info.width
        self.mapHeight = data.info.height
        self.mapOrigin = data.info.origin
        #parse map into 2d array
        self.map_2d = [[0 for x in range(self.mapWidth)] for y in range(self.mapHeight)]
        for line in range(self.mapWidth):
            for row in range(self.mapHeight):
                if (self.map[row+(self.mapWidth*line)]>1):
                    self.map_2d[-row][-line] = 1
        self.mapReceived = True

    def _callback_joint_states(self, data):
        if self.mapReceived:
            rospy.wait_for_message("map", OccupancyGrid)
            name1, name2 = data.name[0],  data.name[1]
            if name1 == "x_joint" and name2 == "y_joint":
                self.robotX = data.position[0]
                self.robotY = data.position[1]
            else:
                rospy.logerr("Could not parse joint names.")
                return

            robotCellX , robotCellY = self._world_to_cell(self.robotX, self.robotY)
            free = self.check_occupation_point(robotCellX, robotCellY)

            if not free:
                fk = FK_Control()
                fk.configuration = [self.robotX+0.05, self.robotY+0.05]
                self.fk_pub.publish(fk)

    def _callback_reset_to_start(self, data):
        if self.point_time_calc+self.point_time_pub+self.line_time_calc+self.line_time_pub != 0:
            rospy.loginfo("\n\n\nStats for last run (Calc + Publish = Total):\n\tPoint time: %s + %s = %s\n\tLine time: %s + %s = %s\n\n", self.point_time_calc, self.point_time_pub, self.point_time_calc+self.point_time_pub, self.line_time_calc, self.line_time_pub, self.line_time_calc+self.line_time_pub)
            self.point_time_calc = self.point_time_pub = self.line_time_calc = self.line_time_pub = 0
        difficulty = rospy.get_param('/difficulty','easy')
        start_pos = [1,0]
        if difficulty == 'medium':
            start_pos = [0,-1]
        if difficulty == 'hard':
            start_pos = [0.25,-0.25]
        if difficulty == 'honor_student':
            start_pos = [0.25,-0.25]
        self.dynreconfig_client.update_configuration({"limit_velocity":False})
        rospy.sleep(.25)
        fk = FK_Control()
        fk.configuration = start_pos
        self.fk_pub.publish(fk)
        rospy.sleep(.25)
        self.dynreconfig_client.update_configuration({"limit_velocity":True})

    def check_occupation_point(self, cell_X, cell_Y):
        if cell_X >= len(self.map_2d) or cell_Y >= len(self.map_2d[cell_X]):
            return True
        if self.map_2d[cell_X][cell_Y] > 0.5:
            free = False
        else:
            free = True
        world_X , world_Y = self._cell_to_world(cell_X, cell_Y)
        return free

    def check_occupation_line(self, cell_startX, cell_startY, cell_goalX, cell_goalY):
        # Check start and End first
        if not self.check_occupation_point(cell_startX, cell_startY):
            return False
        if not self.check_occupation_point(cell_goalX, cell_goalY):
            return False
        # Check if gradient is infinity
        if cell_goalX-cell_startX == 0:
            m = None
        else:
            m = (float(cell_goalY)-float(cell_startY)) / (float(cell_goalX)-float(cell_startX))
        # Calculate X and Y distance
        deltaX = cell_goalX-cell_startX
        deltaY = cell_goalY-cell_startY

        signX = 1 if cell_startX < cell_goalX else -1
        signY = 1 if cell_startY < cell_goalY else -1
        if m is None:
            cell_X = cell_startX
            for i in range(abs(deltaY)):
                cell_Y = math.ceil(cell_startY + i * signY)
                if not self.check_occupation_point(int(cell_X), int(cell_Y)):
                    return False
        elif m == 0.0:
            cell_Y = cell_startY
            for i in range(abs(deltaX)):
                cell_X = math.ceil(cell_startX + i * signX)
                if not self.check_occupation_point(int(cell_X), int(cell_Y)):
                    return False
        else:
            # Go along x axis with deltaX steps
            for i in range(abs(deltaX)):
                cell_X, cell_Y = cell_startX + (i*signX), cell_startY + (i*m*signX)
                if not self.check_occupation_point(int(cell_X), int(cell_Y)):
                    return False
            # Go along y axis with deltaY steps
            for i in range(abs(deltaY)):
                cell_X, cell_Y = cell_startX + (i/m*signY), cell_startY + (i*signY)
                if not self.check_occupation_point(int(cell_X), int(cell_Y)):
                    return False
        return True

    def _world_to_cell(self, x, y):
        cellX = int(-(x+self.mapOrigin.position.x)/self.mapResolution)
        cellY = int(-(y+self.mapOrigin.position.y)/self.mapResolution)
        return cellX, cellY

    def _cell_to_world(self, x,y):
        coordX = -(x * self.mapResolution)-self.mapOrigin.position.x
        coordY = -(y * self.mapResolution)-self.mapOrigin.position.y
        return coordX, coordY

    def map_point_srv(self, req):
        self.start_time = rospy.Time.now().to_sec()
        world_X = req.position[0]
        world_Y = req.position[1]
        response = PointCollisionResponse()
        cell_X, cell_Y = self._world_to_cell(world_X, world_Y)
        free = self.check_occupation_point(cell_X, cell_Y)
        response.free = free
        self.med_time = rospy.Time.now().to_sec()
        self.point_marker_queue.append((world_X, world_Y, free))
        self.stop_time = rospy.Time.now().to_sec()
        self.point_time_calc += self.med_time-self.start_time
        self.point_time_pub += self.stop_time-self.med_time
        return response

    def map_line_srv(self, req):
        self.start_time = rospy.Time.now().to_sec()
        world_startX = req.start[0]
        world_startY = req.start[1]
        world_goalX = req.goal[0]
        world_goalY = req.goal[1]
        response = LineCollisionResponse()
        cell_startX, cell_startY = self._world_to_cell(world_startX, world_startY)
        cell_goalX, cell_goalY = self._world_to_cell(world_goalX, world_goalY)
        free = self.check_occupation_line(cell_startX, cell_startY, cell_goalX, cell_goalY)
        response.free = free
        self.med_time = rospy.Time.now().to_sec()
        if free or self.lines:
            self.line_marker_queue.append((world_startX, world_startY, world_goalX, world_goalY, free))
        self.stop_time = rospy.Time.now().to_sec()
        self.line_time_calc += self.med_time-self.start_time
        self.line_time_pub += self.stop_time-self.med_time
        return response

    def marker_pub_queue(self):
        rate = rospy.Rate(10)
        while not rospy.is_shutdown():
            self.marker_array.markers = []
            while (len(self.point_marker_queue) > 0 or len(self.line_marker_queue) > 0) and len(self.marker_array.markers) < 100:
                try:
                    x,y,free = self.point_marker_queue.popleft()
                    self.marker_array.markers.append(deepcopy(self.get_point_marker(x,y,free)))
                except IndexError:
                    pass
                try:
                    x_s,y_s,x_g,y_g,free = self.line_marker_queue.popleft()
                    self.marker_array.markers.append(deepcopy(self.get_line_marker(x_s,y_s,x_g,y_g,free)))
                except IndexError:
                    pass
            if len(self.marker_array.markers) > 0:
                self.marker_array_pub.publish(self.marker_array)
            rate.sleep()


if __name__ == '__main__':
    try:
        CollisionService()
    except rospy.ROSInterruptException:
        pass
