#!/bin/bash

########################################################################################################
#                                                                                                      #
#    # Introduction                                                                                    #
#      This script will install SLAM with Intel RealSense D435i for Ubuntu 18.04 on Raspberry Pi 4.    #
#                                                                                                      #
#    # Installation Map                                                                                #
#      +-- (0) main (this file)                                                                        #
#      |----- (1) Update Package Manager (apt)                                                         #
#      |----- (2) Install ROS Melodic                                                                  #
#      |----- (3) Install realsense2_camera (RealSense distribution)                                   #
#      +--+-- (4) Install SLAM components                                                              #
#         |----- (i) imu_filter_madgwick                                                               #
#         |----- (ii) rtabmap_ros                                                                      #
#         +----- (iii) robot_localizatio                                                               #
#                                                                                                      #
#    # Reference                                                                                       #
#      Refer to https://github.com/IntelRealSense/realsense-ros/wiki/SLAM-with-D435i                   #
#               https://wiki.ros.org/melodic/Installation/Ubuntu                                       #
#               https://github.com/IntelRealSense/realsense-ros                                        #
#               https://github.com/IntelRealSense/librealsense/blob/master/doc/installation.md         #
#                                                                                                      #
########################################################################################################

# Set global variables.
readonly gkClearColor='\e[0m'
readonly gkSetTitleColor='\e[96m'
readonly gkSetHighlightColor='\e[93m'
readonly ROS_DISTRO=melodic    # ros distribution name.

echo -e "\n"$gkSetTitleColor'Running script '$gkSetHighlightColor'[1/4] Update System'$gkSetTitleColor' ......'$gkClearColor"\n"
. ./1_update_system.bash

echo -e "\n"$gkSetTitleColor'Running script '$gkSetHighlightColor'[2/4] Install ROS '$ROS_DISTRO$gkSetTitleColor' ......'$gkClearColor"\n"
. ./2_install_ros.bash

echo -e "\n"$gkSetTitleColor'Running script '$gkSetHighlightColor'[3/4] Install realsense2_camera'$gkSetTitleColor' ......'$gkClearColor"\n"
. ./3_install_realsense2_camera.bash

echo -e "\n"$gkSetTitleColor'Running script '$gkSetHighlightColor'[4/4] Install SLAM components'$gkSetTitleColor' ......'$gkClearColor"\n"
. ./4_install_slam_components.bash

# Print using guides.
echo -e "\n"$gkSetTitleColor'You can run '$gkSetHighlightColor'roslaunch realsense2_camera opensource_tracking.launch'$gkSetTitleColor' to verify installation.'$gkClearColor"\n"

