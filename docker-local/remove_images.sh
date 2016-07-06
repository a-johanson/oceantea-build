#!/bin/bash

eval "$(docker-machine env default)"

docker rmi oceantea-visualization-gateway
docker rmi oceantea-auth
docker rmi oceantea-scalar-time-series
docker rmi oceantea-vector-time-series
docker rmi oceantea-time-series-conversion
