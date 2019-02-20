#!/bin/bash
IMAGE=dylanvanassche/coaco-docker:latest
VOLUME=ros_mount
PORT=11311

echo "Shared volume will be mounted in: $HOME/$VOLUME"
echo "Pulling Docker image: $IMAGE"
docker pull $IMAGE
docker run -t -i -v $HOME/$VOLUME:/root/$VOLUME -p $PORT:$PORT $IMAGE /bin/bash
