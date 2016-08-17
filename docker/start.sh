#!/bin/bash

function pullImage {
    docker pull ajohanson/$1
}

pullImage oceantea-auth
pullImage oceantea-time-series-conversion
pullImage oceantea-vector-time-series
pullImage oceantea-scalar-time-series
pullImage oceantea-visualization-gateway


function createVolume {
    if [[ "$(docker volume ls | grep $1)" == "" ]]; then
        echo "Volume $1 does not exist"
        docker volume create --name $1
    else 
        echo "Volume $1 already exists"
    fi
}

createVolume oceantea-scalar-vol
createVolume oceantea-vector-vol


function runContainer {
    if [[ "$(docker ps -a | grep $1-inst)" == "" ]]; then
        echo "Container $1-inst does not exist"
        docker run -d ${@:2} --name="$1-inst" -t ajohanson/$1
    else 
        echo "Container $1-inst already exists"
        docker start $1-inst
    fi
}

runContainer oceantea-auth
runContainer oceantea-time-series-conversion
# TODO: Does the // trick work on Mac/Linux too?
runContainer oceantea-vector-time-series -v oceantea-vector-vol://usr/src/app/data
runContainer oceantea-scalar-time-series --link oceantea-time-series-conversion-inst -v oceantea-scalar-vol://usr/src/app/data
runContainer oceantea-visualization-gateway -p 3333:3333 --link oceantea-auth-inst --link oceantea-time-series-conversion-inst --link oceantea-vector-time-series-inst --link oceantea-scalar-time-series-inst


read -p "Press enter to start OceanTEA..." ignore_input_variable
echo "Opening http://localhost:3333 in browser..."
# NOTE: This is specific for MS Windows!
start "http://localhost:3333"
