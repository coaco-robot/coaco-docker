#!/bin/bash
IMAGE=dylanvanassche/coaco-docker:latest
VOLUME=ros_mount
PORT=11311

echo "Shared volume will be mounted in: $HOME/$VOLUME"
echo "Pulling Docker image: $IMAGE"
echo "You should set the ROS_MASTER_URI to http://IP_OF_THIS_PC:11311 on ALL REMOTE devices! We assume that roscore is running in our Docker!"
echo "Launching a roscore instance can be done using: roscore & (in the background)"
echo "Enabling X11 passing: xhost +local:docker"
xhost +local:docker
echo "NEVER deploy this Docker in production, X11 org passing is done in an insecure way!"
docker pull $IMAGE
docker run --privileged -t -i -v $HOME/$VOLUME:/root/$VOLUME -p $PORT:$PORT \
    --user=root \
    --env="DISPLAY" \
    --volume="/etc/group:/etc/group:ro" \
    --volume="/etc/passwd:/etc/passwd:ro" \
    --volume="/etc/shadow:/etc/shadow:ro" \
    --volume="/etc/sudoers.d:/etc/sudoers.d:ro" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    $IMAGE /bin/bash
