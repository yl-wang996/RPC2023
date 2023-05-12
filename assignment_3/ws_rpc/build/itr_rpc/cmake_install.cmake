# Install script for directory: /homeL/1wang/RPC2023/assignment_3/ws_rpc/src/itr_rpc

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/homeL/1wang/RPC2023/assignment_3/ws_rpc/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
        file(MAKE_DIRECTORY "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
      endif()
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin")
        file(WRITE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin" "")
      endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/homeL/1wang/RPC2023/assignment_3/ws_rpc/install/_setup_util.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/homeL/1wang/RPC2023/assignment_3/ws_rpc/install" TYPE PROGRAM FILES "/homeL/1wang/RPC2023/assignment_3/ws_rpc/build/itr_rpc/catkin_generated/installspace/_setup_util.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/homeL/1wang/RPC2023/assignment_3/ws_rpc/install/env.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/homeL/1wang/RPC2023/assignment_3/ws_rpc/install" TYPE PROGRAM FILES "/homeL/1wang/RPC2023/assignment_3/ws_rpc/build/itr_rpc/catkin_generated/installspace/env.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/homeL/1wang/RPC2023/assignment_3/ws_rpc/install/setup.bash;/homeL/1wang/RPC2023/assignment_3/ws_rpc/install/local_setup.bash")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/homeL/1wang/RPC2023/assignment_3/ws_rpc/install" TYPE FILE FILES
    "/homeL/1wang/RPC2023/assignment_3/ws_rpc/build/itr_rpc/catkin_generated/installspace/setup.bash"
    "/homeL/1wang/RPC2023/assignment_3/ws_rpc/build/itr_rpc/catkin_generated/installspace/local_setup.bash"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/homeL/1wang/RPC2023/assignment_3/ws_rpc/install/setup.sh;/homeL/1wang/RPC2023/assignment_3/ws_rpc/install/local_setup.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/homeL/1wang/RPC2023/assignment_3/ws_rpc/install" TYPE FILE FILES
    "/homeL/1wang/RPC2023/assignment_3/ws_rpc/build/itr_rpc/catkin_generated/installspace/setup.sh"
    "/homeL/1wang/RPC2023/assignment_3/ws_rpc/build/itr_rpc/catkin_generated/installspace/local_setup.sh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/homeL/1wang/RPC2023/assignment_3/ws_rpc/install/setup.zsh;/homeL/1wang/RPC2023/assignment_3/ws_rpc/install/local_setup.zsh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/homeL/1wang/RPC2023/assignment_3/ws_rpc/install" TYPE FILE FILES
    "/homeL/1wang/RPC2023/assignment_3/ws_rpc/build/itr_rpc/catkin_generated/installspace/setup.zsh"
    "/homeL/1wang/RPC2023/assignment_3/ws_rpc/build/itr_rpc/catkin_generated/installspace/local_setup.zsh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/homeL/1wang/RPC2023/assignment_3/ws_rpc/install/.rosinstall")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/homeL/1wang/RPC2023/assignment_3/ws_rpc/install" TYPE FILE FILES "/homeL/1wang/RPC2023/assignment_3/ws_rpc/build/itr_rpc/catkin_generated/installspace/.rosinstall")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  include("/homeL/1wang/RPC2023/assignment_3/ws_rpc/build/itr_rpc/catkin_generated/safe_execute_install.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/itr_rpc/msg" TYPE FILE FILES "/homeL/1wang/RPC2023/assignment_3/ws_rpc/src/itr_rpc/msg/FK_Control.msg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/itr_rpc/srv" TYPE FILE FILES
    "/homeL/1wang/RPC2023/assignment_3/ws_rpc/src/itr_rpc/srv/IK_Solve.srv"
    "/homeL/1wang/RPC2023/assignment_3/ws_rpc/src/itr_rpc/srv/PointCollision.srv"
    "/homeL/1wang/RPC2023/assignment_3/ws_rpc/src/itr_rpc/srv/LineCollision.srv"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/itr_rpc/cmake" TYPE FILE FILES "/homeL/1wang/RPC2023/assignment_3/ws_rpc/build/itr_rpc/catkin_generated/installspace/itr_rpc-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/homeL/1wang/RPC2023/assignment_3/ws_rpc/devel/.private/itr_rpc/include/itr_rpc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/homeL/1wang/RPC2023/assignment_3/ws_rpc/devel/.private/itr_rpc/share/roseus/ros/itr_rpc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/homeL/1wang/RPC2023/assignment_3/ws_rpc/devel/.private/itr_rpc/share/common-lisp/ros/itr_rpc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/homeL/1wang/RPC2023/assignment_3/ws_rpc/devel/.private/itr_rpc/share/gennodejs/ros/itr_rpc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/homeL/1wang/RPC2023/assignment_3/ws_rpc/devel/.private/itr_rpc/lib/python3/dist-packages/itr_rpc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/homeL/1wang/RPC2023/assignment_3/ws_rpc/devel/.private/itr_rpc/lib/python3/dist-packages/itr_rpc" REGEX "/\\_\\_init\\_\\_\\.py$" EXCLUDE REGEX "/\\_\\_init\\_\\_\\.pyc$" EXCLUDE)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/homeL/1wang/RPC2023/assignment_3/ws_rpc/devel/.private/itr_rpc/lib/python3/dist-packages/itr_rpc" FILES_MATCHING REGEX "/homeL/1wang/RPC2023/assignment_3/ws_rpc/devel/\\.private/itr_rpc/lib/python3/dist-packages/itr_rpc/.+/__init__.pyc?$")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/itr_rpc" TYPE FILE FILES "/homeL/1wang/RPC2023/assignment_3/ws_rpc/devel/.private/itr_rpc/include/itr_rpc/KinematicsConfigConfig.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/homeL/1wang/RPC2023/assignment_3/ws_rpc/devel/.private/itr_rpc/lib/python3/dist-packages/itr_rpc/cfg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages/itr_rpc" TYPE DIRECTORY FILES "/homeL/1wang/RPC2023/assignment_3/ws_rpc/devel/.private/itr_rpc/lib/python3/dist-packages/itr_rpc/cfg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/homeL/1wang/RPC2023/assignment_3/ws_rpc/build/itr_rpc/catkin_generated/installspace/itr_rpc.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/itr_rpc/cmake" TYPE FILE FILES "/homeL/1wang/RPC2023/assignment_3/ws_rpc/build/itr_rpc/catkin_generated/installspace/itr_rpc-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/itr_rpc/cmake" TYPE FILE FILES
    "/homeL/1wang/RPC2023/assignment_3/ws_rpc/build/itr_rpc/catkin_generated/installspace/itr_rpcConfig.cmake"
    "/homeL/1wang/RPC2023/assignment_3/ws_rpc/build/itr_rpc/catkin_generated/installspace/itr_rpcConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/itr_rpc" TYPE FILE FILES "/homeL/1wang/RPC2023/assignment_3/ws_rpc/src/itr_rpc/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/itr_rpc" TYPE PROGRAM FILES
    "/homeL/1wang/RPC2023/assignment_3/ws_rpc/src/itr_rpc/nodes/compare.py"
    "/homeL/1wang/RPC2023/assignment_3/ws_rpc/src/itr_rpc/nodes/kinematics_controller.py"
    "/homeL/1wang/RPC2023/assignment_3/ws_rpc/src/itr_rpc/nodes/dummy_fk.py"
    "/homeL/1wang/RPC2023/assignment_3/ws_rpc/src/itr_rpc/nodes/dummy_ik.py"
    "/homeL/1wang/RPC2023/assignment_3/ws_rpc/src/itr_rpc/nodes/script.py"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/homeL/1wang/RPC2023/assignment_3/ws_rpc/build/itr_rpc/gtest/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/homeL/1wang/RPC2023/assignment_3/ws_rpc/build/itr_rpc/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
