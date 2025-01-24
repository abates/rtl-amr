#!/bin/bash

IMAGE="abates314/rtl-amr"
echo "Building Docker images"
docker buildx build --push --platform linux/arm,linux/386,linux/amd64 -t $IMAGE .

