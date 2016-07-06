#!/bin/bash

toolboxDir=$(echo "/$DOCKER_TOOLBOX_INSTALL_PATH" | sed -e 's/\\/\//g' -e 's/://')
cd "$toolboxDir"
./start.sh echo "return to script"

eval "$(docker-machine env default)"

docker stop oceantea-visualization-gateway-inst
docker stop oceantea-auth-inst
docker stop oceantea-scalar-time-series-inst
docker stop oceantea-vector-time-series-inst
docker stop oceantea-time-series-conversion-inst

./remove_containers.sh
./remove_images.sh

docker-machine stop
