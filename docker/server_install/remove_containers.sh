#!/bin/bash

docker rm -f oceantea-visualization-gateway-inst
docker rm -f oceantea-auth-inst
docker rm -f oceantea-scalar-time-series-inst
docker rm -f oceantea-vector-time-series-inst
docker rm -f oceantea-time-series-conversion-inst
docker rm -f oceantea-spatial-analysis-inst

docker rm -f oceantea-coral-analysis-inst
