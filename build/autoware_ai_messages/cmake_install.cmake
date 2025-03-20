# Install script for directory: /media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/media/kongquyu/WD_BLACK/bevfusion_ws/install")
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

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/autoware_msgs/msg" TYPE FILE FILES
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/AccelCmd.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/AdjustXY.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/BrakeCmd.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/Centroids.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/CloudCluster.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/CloudClusterArray.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/ColorSet.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/ControlCommand.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/ControlCommandStamped.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/DTLane.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/DetectedObject.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/DetectedObjectArray.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/ExtractedPosition.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/Gear.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/GeometricRectangle.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/ICPStat.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/ImageLaneObjects.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/ImageObj.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/ImageObjRanged.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/ImageObjTracked.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/ImageObjects.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/ImageRect.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/ImageRectRanged.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/IndicatorCmd.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/LampCmd.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/Lane.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/LaneArray.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/NDTStat.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/ObjLabel.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/ObjPose.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/PointsImage.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/ProjectionMatrix.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/RemoteCmd.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/ScanImage.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/Signals.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/State.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/StateCmd.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/SteerCmd.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/SyncTimeDiff.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/SyncTimeMonitor.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/TrafficLight.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/TrafficLightResult.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/TrafficLightResultArray.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/TunedResult.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/ValueSet.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/VehicleCmd.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/VehicleLocation.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/VehicleStatus.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/VscanTracked.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/VscanTrackedArray.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/Waypoint.msg"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/msg/WaypointState.msg"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/autoware_msgs/srv" TYPE FILE FILES "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/srv/RecognizeLightState.srv")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/autoware_msgs/cmake" TYPE FILE FILES "/media/kongquyu/WD_BLACK/bevfusion_ws/build/autoware_ai_messages/catkin_generated/installspace/autoware_msgs-msg-paths.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/media/kongquyu/WD_BLACK/bevfusion_ws/devel/include/autoware_msgs")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/media/kongquyu/WD_BLACK/bevfusion_ws/devel/share/roseus/ros/autoware_msgs")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/media/kongquyu/WD_BLACK/bevfusion_ws/devel/share/common-lisp/ros/autoware_msgs")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/media/kongquyu/WD_BLACK/bevfusion_ws/devel/share/gennodejs/ros/autoware_msgs")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/media/kongquyu/WD_BLACK/bevfusion_ws/devel/lib/python2.7/dist-packages/autoware_msgs")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/media/kongquyu/WD_BLACK/bevfusion_ws/devel/lib/python2.7/dist-packages/autoware_msgs")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/media/kongquyu/WD_BLACK/bevfusion_ws/build/autoware_ai_messages/catkin_generated/installspace/autoware_msgs.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/autoware_msgs/cmake" TYPE FILE FILES "/media/kongquyu/WD_BLACK/bevfusion_ws/build/autoware_ai_messages/catkin_generated/installspace/autoware_msgs-msg-extras.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/autoware_msgs/cmake" TYPE FILE FILES
    "/media/kongquyu/WD_BLACK/bevfusion_ws/build/autoware_ai_messages/catkin_generated/installspace/autoware_msgsConfig.cmake"
    "/media/kongquyu/WD_BLACK/bevfusion_ws/build/autoware_ai_messages/catkin_generated/installspace/autoware_msgsConfig-version.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/autoware_msgs" TYPE FILE FILES "/media/kongquyu/WD_BLACK/bevfusion_ws/src/autoware_ai_messages/package.xml")
endif()

