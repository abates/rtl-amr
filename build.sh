#!/bin/bash

IMAGE="abates314/rtl-amr"
CMDS="rtlamr rtlamr-collect"
ARCHS="386 arm amd64 arm64"

build () {
  export GOARCH=$1
  CMD=$2
  mkdir -p dist/$GOARCH
  if [[ -e dist/$GOARCH/$CMD ]]; then
    echo "Build: Skipping dist/$GOARCH/$CMD"
    return
  fi
  echo "Build: dist/$GOARCH/$CMD"
  GOOS=linux go build -o dist/$GOARCH/$CMD github.com/bemasher/$CMD
}

export GOPATH=$(cd `dirname $0` && pwd)
echo "Getting/Updating packages"
go get -u github.com/bemasher/rtlamr
go get -u github.com/bemasher/rtlamr-collect

for CMD in $CMDS ; do
  for ARCH in $ARCHS ; do
    build $ARCH $CMD
  done
done

echo "Building Docker images"
docker buildx build --push --platform linux/arm,linux/386,linux/amd64 -t $IMAGE .
