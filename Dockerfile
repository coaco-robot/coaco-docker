FROM ros:kinetic-robot-xenial

# Upgrade the Docker image pakckages and install the full ROS package
RUN apt update -y && apt full-upgrade -y 
RUN apt install -y ros-kinetic-desktop-full=1.3.2-0*

# Install offline Robot Simulators
RUN apt install -y mpg123 python python-pip python3 python3-pip python-virtualenv

# Install usefull packages
RUN apt install -y vim iputils-ping net-tools wget

# Setup the folder containing the catkin workspace
RUN mkdir -p ~/catkin_ws/src
RUN /bin/bash -c '. /opt/ros/kinetic/setup.bash; cd ~/catkin_ws; catkin_make; source ./devel/setup.bash'

# Python packages
RUN pip3 install --upgrade pip setuptools
RUN pip3 install rospkg
RUN pip3 install -U `pip3 list --outdated | tail -n +3 | awk '{print $1}'`


