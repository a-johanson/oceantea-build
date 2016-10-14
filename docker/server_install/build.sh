#!/bin/bash

echo "Cleaning up build files..."
rm -rf ./build
mkdir ./build
cd ./build

function rebuildImage {
	echo "Removing old image $1..."
	docker rm -f $1-inst
	docker rmi $1
	echo "Cloning repo $1..."
	git clone https://github.com/a-johanson/$1.git
	echo "Building image $1..."
	docker build -t $1 ./$1/
}
# main
rebuildImage oceantea-auth
rebuildImage oceantea-time-series-conversion
rebuildImage oceantea-spatial-analysis
rebuildImage oceantea-vector-time-series
rebuildImage oceantea-scalar-time-series
rebuildImage oceantea-visualization-gateway
# plugin
rebuildImage oceantea-coral-analysis



function runContainer {\
	echo "Starting container $1-inst..."
	docker run -d --restart=always ${@:2} --name="$1-inst" -t $1
}

runContainer oceantea-coral-analysis -v /dockervol/oceantea/coral_analysis:/usr/src/app/data

runContainer oceantea-auth -v /dockervol/oceantea/auth_config:/usr/src/app/config
runContainer oceantea-time-series-conversion
runContainer oceantea-spatial-analysis -v /dockervol/oceantea/bathymetry:/usr/src/app/data
runContainer oceantea-vector-time-series -v /dockervol/oceantea/vector:/usr/src/app/data
runContainer oceantea-scalar-time-series --link oceantea-time-series-conversion-inst -v /dockervol/oceantea/scalar:/usr/src/app/data
runContainer oceantea-visualization-gateway -p 9090:3333 -v /dockervol/oceantea/api_config:/usr/src/app/config --link oceantea-auth-inst --link oceantea-time-series-conversion-inst --link oceantea-spatial-analysis-inst --link oceantea-vector-time-series-inst --link oceantea-scalar-time-series-inst --link oceantea-coral-analysis-inst
