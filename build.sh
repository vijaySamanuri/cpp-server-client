#!/bin/bash
image_name="vijaysamanuri/cpp-server-client:1.0"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
docker build -t $image_name ${DIR}/.
docker rm -f build-cpp || echo "old build-cpp container not found"
docker run --name build-cpp -d  $image_name sleep 1
mkdir -p $DIR/dist
docker cp build-cpp:/client-server-src/example-client/client $DIR/dist/client 
docker cp build-cpp:/client-server-src/example-server/server $DIR/dist/server
