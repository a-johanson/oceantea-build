#!/bin/bash

docker run -d --net=host -p 3333:3333 -p 3334:3334 --name="oceantea-visualization-gateway-inst" -t oceantea-visualization-gateway
docker run -d --net=host -p 3332:3332 --name="oceantea-auth-inst" -t oceantea-auth
docker run -d --net=host -p 3335:3335 -v ~/Desktop/OceanTEA/scalar_data:/usr/src/app/data --name="oceantea-scalar-time-series-inst" -t oceantea-scalar-time-series
docker run -d --net=host -p 3336:3336 -v ~/Desktop/OceanTEA/vector_data:/usr/src/app/data --name="oceantea-vector-time-series-inst" -t oceantea-vector-time-series
docker run -d --net=host -p 3337:3337 --name="oceantea-time-series-conversion-inst" -t oceantea-time-series-conversion

MACHINEIP="$(docker-machine ip)"
echo "Open http://${MACHINEIP}:3333 in browser..."
start "http://${MACHINEIP}:3333"
