#!/bin/bash
IMAGE=dylanvanassche/coaco-docker:latest
VOLUME=ros_mount

echo "Shared volume will be mounted in: $HOME/$VOLUME"
echo "Pulling Docker image: $IMAGE"
docker pull $IMAGE
docker run -t -i -v $HOME/$VOLUME:/root/$VOLUME $IMAGE /bin/bash
