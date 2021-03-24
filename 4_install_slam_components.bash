
# Refer to https://github.com/IntelRealSense/realsense-ros/wiki/SLAM-with-D435i .

# Install SLAM components.
echo -e "\n"$gkSetTitleColor'# Install SLAM components.'$gkClearColor"\n"
sudo apt install ros-melodic-imu-filter-madgwick -y
sudo apt install ros-melodic-rtabmap-ros -y
sudo apt install ros-melodic-robot-localization -y

