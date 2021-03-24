
# Refer to https://wiki.ros.org/melodic/Installation/Ubuntu .

# Install ros.
echo -e "\n"$gkSetTitleColor'# Install ros.'$gkClearColor"\n"
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
curl -sSL 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC1CF6E31E6BADE8868B172B4F42ED6FBAB17C654' | sudo apt-key add -
sudo apt update
sudo apt install ros-melodic-desktop-full -y

# Environment setup.
echo -e "\n"$gkSetTitleColor'# Environment setup.'$gkClearColor"\n"
echo "# ros $ROS_DISTRO" >> ~/.bashrc
echo -e "source /opt/ros/$ROS_DISTRO/setup.bash\n" >> ~/.bashrc
source ~/.bashrc

# Install ros tools for building packages.
echo -e "\n"$gkSetTitleColor'# Install ros tools for building packages.'$gkClearColor"\n"
sudo apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential -y
sudo rosdep init
rosdep update

