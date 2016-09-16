#!/bin/bash

function pullImage {
    docker pull ajohanson/$1
}

pullImage oceantea-auth
pullImage oceantea-time-series-conversion
pullImage oceantea-spatial-analysis
pullImage oceantea-vector-time-series
pullImage oceantea-scalar-time-series
pullImage oceantea-visualization-gateway

pullImage oceantea-coral-analysis



function runContainer {
    if [[ "$(docker ps -a | grep $1-inst)" == "" ]]; then
        echo "Container $1-inst does not exist"
        docker run -d --restart=always ${@:2} --name="$1-inst" -t ajohanson/$1
    else 
        echo "Container $1-inst already exists"
        docker start $1-inst
    fi
}

runContainer oceantea-coral-analysis -v /dockervol/oceantea/coral_analysis:/usr/src/app/data

runContainer oceantea-auth -v /dockervol/oceantea/auth_config:/usr/src/app/config
runContainer oceantea-time-series-conversion
runContainer oceantea-spatial-analysis -v /dockervol/oceantea/bathymetry:/usr/src/app/data
runContainer oceantea-vector-time-series -v /dockervol/oceantea/vector:/usr/src/app/data
runContainer oceantea-scalar-time-series --link oceantea-time-series-conversion-inst -v /dockervol/oceantea/scalar:/usr/src/app/data
runContainer oceantea-visualization-gateway -p 9090:3333 -v /dockervol/oceantea/api_config:/usr/src/app/config --link oceantea-auth-inst --link oceantea-time-series-conversion-inst --link oceantea-spatial-analysis-inst --link oceantea-vector-time-series-inst --link oceantea-scalar-time-series-inst --link oceantea-coral-analysis-inst
