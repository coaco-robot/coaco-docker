#!/bin/bash
IMAGE=dylanvanassche/coaco-docker:latest
VOLUME=ros_mount
PORT=11311

echo "Shared volume will be mounted in: $HOME/$VOLUME"
echo "Pulling Docker image: $IMAGE"
echo "You should set the ROS_MASTER_URI to http://IP_OF_THIS_PC:11311 on ALL REMOTE devices! We assume that roscore is running in our Docker!"
echo "Launching a roscore instance can be done using: roscore & (in the background)"
docker pull $IMAGE
docker run -t -i -v $HOME/$VOLUME:/root/$VOLUME -p $PORT:$PORT $IMAGE /bin/bash
