#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# sudo apt install ros-kinetic-kdl-parser-py
import rospy
import roslib
import math
from random import random

from dynamic_reconfigure.server import Server
from itr_rpc.cfg import KinematicsConfig

from sensor_msgs.msg import JointState
from itr_rpc.msg import FK_Control
from itr_rpc.srv import IK_Solve, IK_SolveResponse, IK_SolveRequest
from urdf_parser_py.urdf import URDF
from trac_ik_python.trac_ik import IK
from tf.transformations import quaternion_from_euler


class JointStatePublisher:
    def __init__(self):
        # Initialize node
        rospy.init_node('joint_state_publisher')
        self.pub = rospy.Publisher('joint_states', JointState, queue_size=10)
        rospy.Subscriber("fk_control", FK_Control, self.callback_fk_control)
        # IK Service initalization
        self.ik_service = rospy.Service('IK_Solve', IK_Solve, self.solve_ik)
        # Initialize joints, targets and variables
        self.goal_positions = []
        self.names = []
        self.limits_upper = []
        self.limits_lower = []
        self.velocity = []
        self.current_position = []
        self.rate = 100
        self.duration = (1.0/self.rate)
        self.limit_velocity = True
        self.position_error = [0, 0, 0]
        self.orientation_error = [0, 0, 0]
        # Dynamic reconfigure Service, must be last, to avoid overwriting
        self.dyn_reconfig = Server(
            KinematicsConfig, self.callback_dyn_reconfig)

        # Read URDF and parse limits
        robot = URDF.from_parameter_server()

        # Get root link (must be unique)
        self.root = robot.get_root()
        # Try to get tcp by name
        self.tcp = next(
            (link.name for link in robot.links if link.name == "tcp"), None)

        # Get the tcp by choosing the link with no child which creates the longest overall chain
        if self.tcp is None:
            children = set(
                [robot.joint_map[joint].parent for joint in robot.joint_map])
            links = set([link.name for link in robot.links])
            tcp_candidates = links - children
            chains = dict.fromkeys(tcp_candidates, 0)
            for tcp_candidate in tcp_candidates:
                chains[tcp_candidate] = len(
                    robot.get_chain(self.root, tcp_candidate))
            self.tcp = max(chains, key=chains.get)
        rospy.loginfo("Using robot chain from %s to %s" %
                      (self.root, self.tcp))

        # Get joint and link chains from root to tcp
        self.joint_chain = robot.get_chain(
            self.root, self.tcp, joints=True, links=False, fixed=False)
        self.link_chain = robot.get_chain(
            self.root, self.tcp, joints=False, links=True, fixed=False)

        # Create ordered list of joints from root to tcp
        for joint in self.joint_chain:
            self.names.append(joint)
            self.goal_positions.append(0)
            self.limits_upper.append(robot.joint_map[joint].limit.upper)
            self.limits_lower.append(robot.joint_map[joint].limit.lower)
            if (robot.joint_map[joint].joint_type) == 'continuous':
                rospy.logwarn(
                    "Joint %s seems to be continuous. Joint limits will be ignored" % joint)
            self.velocity.append(robot.joint_map[joint].limit.velocity)
            self.current_position.append(0)

        # Initialize trac_ik
        self.ik_solver = IK(self.root, self.tcp)

        # Run main loop
        self.main_loop()

    def callback_fk_control(self, data):
        # Calculate goal joint values depending on joint limits
        self.goal_positions = self.position_with_limits(data.configuration)

    def callback_dyn_reconfig(self, config, level):
        self.limit_velocity = config["limit_velocity"]
        self.position_error = [config["pos_x_err"],
                               config["pos_y_err"], config["pos_z_err"]]
        self.orientation_error = [config["orient_x_err"],
                                  config["orient_y_err"], config["orient_z_err"]]
        rospy.loginfo("Changed configuration parameter\n\tLimit velocity: %s\n\tPosition Error: %s\n\tOrientation Error: %s" % (
            self.limit_velocity, self.position_error, self.orientation_error))
        return config

    def position_with_limits(self, positions):
        positions_with_limits = list(positions)
        # Append old joint values if too few joint values specified
        if (len(positions) < len(self.names)):
            positions = positions + \
                tuple(self.current_position[len(positions):])
        # Check if values are in range
        for jointID in range(len(self.names)):
            # Limits
            if positions[jointID] > self.limits_upper[jointID]:
                positions_with_limits[jointID] = self.limits_upper[jointID]
                rospy.logerr("The goal position for joint %s is above the joints upper limit and was set to %s instead of %s." % (
                    jointID, self.limits_upper[jointID], positions[jointID]))
            elif positions[jointID] < self.limits_lower[jointID]:
                positions_with_limits[jointID] = self.limits_lower[jointID]
                rospy.logerr("The goal position for joint %s is below the joints lower limit and was set to %s instead of %s." % (
                    jointID, self.limits_lower[jointID], positions[jointID]))

        return positions_with_limits

    def main_loop(self):
        r = rospy.Rate(self.rate)
        joint_state = JointState()
        joint_state.name = self.names
        joint_state.position = self.goal_positions
        joint_state.velocity = self.velocity
        self.pub.publish(joint_state)

        while not rospy.is_shutdown():
            for jointID in range(len(self.goal_positions)):
                distance = self.goal_positions[jointID] - \
                    self.current_position[jointID]
                velocity = distance / self.duration

                if self.limit_velocity:
                    if math.fabs(velocity) > self.velocity[jointID]:
                        if velocity < 0:
                            self.goal_positions[jointID] = self.current_position[jointID] - \
                                self.velocity[jointID] * self.duration
                        else:
                            self.goal_positions[jointID] = self.current_position[jointID] + \
                                self.velocity[jointID] * self.duration

                self.current_position[jointID] = self.goal_positions[jointID]
            joint_state.header.stamp = rospy.Time.now()
            joint_state.position = self.goal_positions
            self.pub.publish(joint_state)
            r.sleep()

    def solve_ik(self, req):
        if len(req.seed) == 0:
            seed = [random()] * self.ik_solver.number_of_joints
        elif len(req.seed) == 1:
            seed = [req.seed] * self.ik_solver.number_of_joints
        elif len(req.seed) == self.ik_solver.number_of_joints:
            seed = list(req.seed)
        else:
            rospy.logwarn(
                "Invalid number of seed parameters specified, Randomizing")
            rospy.logwarn("Require %s parameters but got %s" %
                          (self.ik_solver.number_of_joints, len(req.seed)))
            seed = [random()] * self.ik_solver.number_of_joints

        orientation_quat = quaternion_from_euler(
            req.orientation[0], req.orientation[1], req.orientation[2])
        configuration = self.ik_solver.get_ik(seed,
                                              req.position[0], req.position[1], req.position[2],
                                              orientation_quat[0], orientation_quat[1], orientation_quat[2], orientation_quat[3],
                                              # position error
                                              self.position_error[0], self.position_error[1], self.position_error[2],
                                              self.orientation_error[0], self.orientation_error[1], self.orientation_error[2])  # orientation error

        if configuration is not None:
            response = IK_SolveResponse()
            response.configuration = configuration
            return response
        else:
            raise rospy.ServiceException("Could not find an IK solution for\n\tposition: %s\n\torientation: %s\n\tposition_error: %s\n\torientation_error: %s" % (
                req.position, req.orientation, self.position_error, self.orientation_error))


if __name__ == '__main__':
    try:
        JointStatePublisher()
    except rospy.ROSInterruptException:
        pass


# Add check for axis of TCP to task sheet or test
