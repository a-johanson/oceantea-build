#!/bin/bash

workDir=$(pwd)

# NOTE: This is specific for MS Windows!
toolboxDir=$(echo "/$DOCKER_TOOLBOX_INSTALL_PATH" | sed -e 's/\\/\//g' -e 's/://')
cd "$toolboxDir"
./start.sh echo "return to script"

cd "$workDir"
eval "$(docker-machine env default)"

docker stop oceantea-visualization-gateway-inst
docker stop oceantea-auth-inst
docker stop oceantea-scalar-time-series-inst
docker stop oceantea-vector-time-series-inst
docker stop oceantea-time-series-conversion-inst

docker rm oceantea-visualization-gateway-inst
docker rm oceantea-auth-inst
docker rm oceantea-scalar-time-series-inst
docker rm oceantea-vector-time-series-inst
docker rm oceantea-time-series-conversion-inst

docker rmi oceantea-visualization-gateway
docker rmi oceantea-auth
docker rmi oceantea-scalar-time-series
docker rmi oceantea-vector-time-series
docker rmi oceantea-time-series-conversion

docker-machine stop
