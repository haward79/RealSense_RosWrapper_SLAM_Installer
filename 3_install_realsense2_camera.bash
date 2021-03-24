
# Refer to https://github.com/IntelRealSense/librealsense/blob/master/doc/installation.md .

# Offline all RealSense camera.
echo -e "\n"$gkSetTitleColor'# Offline all RealSense camera.'$gkClearColor"\n"
echo 'Please disconnect all RealSense Camera'
read -p 'Press any key to continue ......' trash
unset trash

# Install libraries for building librealsense.
echo -e "\n"$gkSetTitleColor'# Install libraries for building librealsense.'$gkClearColor"\n"
sudo apt install git libssl-dev libusb-1.0-0-dev pkg-config libgtk-3-dev -y
sudo apt install libglfw3-dev libgl1-mesa-dev libglu1-mesa-dev at -y

# Setup environment for librealsense.
echo -e "\n"$gkSetTitleColor'# Setup environment for librealsense.'$gkClearColor"\n"
git clone https://github.com/IntelRealSense/librealsense.git
cd librealsense
./scripts/setup_udev_rules.sh
echo 'hid_sensor_custom' | sudo tee -a /etc/modules

# Install librealsense library.
echo -e "\n"$gkSetTitleColor'# Install librealsense library.'$gkClearColor"\n"
mkdir build && cd build
cmake ../ -DCMAKE_BUILD_TYPE=Release -DBUILD_EXAMPLES=true
make -j 4
sudo make install
cd ../../

# Install RealSense ros.
echo -e "\n"$gkSetTitleColor'# Install RealSense ros.'$gkClearColor"\n"
sudo apt install ros-melodic-ddynamic-reconfigure
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/src/
git clone https://github.com/IntelRealSense/realsense-ros.git
cd realsense-ros/
git checkout `git tag | sort -V | grep -P "^2.\d+\.\d+" | tail -1`
cd ..
catkin_init_workspace
cd ..
source "/opt/ros/$ROS_DISTRO/setup.bash"
catkin_make clean
catkin_make -DCATKIN_ENABLE_TESTING=False -DCMAKE_BUILD_TYPE=Release
catkin_make install
cd ..

# Environment setup.
echo -e "\n"$gkSetTitleColor'# Environment setup.'$gkClearColor"\n"
echo '# catkin' >> ~/.bashrc
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
echo '' >> ~/.bashrc
source ~/.bashrc

