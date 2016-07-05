#!/bin/bash

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
