#!/bin/bash

rm -rf ./build
mkdir ./build
cd ./build

git clone https://github.com/a-johanson/oceantea-visualization-gateway.git
docker build -t oceantea-visualization-gateway ./oceantea-visualization-gateway/

git clone https://github.com/a-johanson/oceantea-auth.git
docker build -t oceantea-auth ./oceantea-auth/

git clone https://github.com/a-johanson/oceantea-vector-time-series.git
docker build -t oceantea-vector-time-series ./oceantea-vector-time-series/

git clone https://github.com/a-johanson/oceantea-scalar-time-series.git
docker build -t oceantea-scalar-time-series ./oceantea-scalar-time-series/

git clone https://github.com/a-johanson/oceantea-time-series-conversion.git
docker build -t oceantea-time-series-conversion ./oceantea-time-series-conversion/

