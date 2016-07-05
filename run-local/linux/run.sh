#!/bin/bash

set -x #echo on

export NODE_ENV=production
cd ../../../oceantea-visualization-gateway
npm install
npm update
nohup node index.js > std.out 2> std.err < /dev/null &
cd ../oceantea-auth
npm install
npm update
nohup node index.js > std.out 2> std.err < /dev/null &
cd ../oceantea-scalar-time-series
npm install
npm update
nohup node index.js > std.out 2> std.err < /dev/null &
cd ../oceantea-time-series-conversion
npm install
npm update
nohup node index.js > std.out 2> std.err < /dev/null &
cd ../oceantea-vector-time-series
nohup python3 server.py > std.out 2> std.err < /dev/null &
cd ../oceantea-build/run-local/linux
