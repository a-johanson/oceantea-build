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



function runContainer {
    if [[ "$(docker ps -a | grep $1-inst)" == "" ]]; then
        echo "Container $1-inst does not exist"
        docker run -d --restart=always ${@:2} --name="$1-inst" -t ajohanson/$1
    else 
        echo "Container $1-inst already exists"
        docker start $1-inst
    fi
}

runContainer oceantea-auth -v /dockervolumes/oceantea/auth_config:/usr/src/app/config
runContainer oceantea-time-series-conversion
runContainer oceantea-spatial-analysis -v /dockervolumes/oceantea/bathymetry:/usr/src/app/data
runContainer oceantea-vector-time-series -v /dockervolumes/oceantea/vector:/usr/src/app/data
runContainer oceantea-scalar-time-series --link oceantea-time-series-conversion-inst -v /dockervolumes/oceantea/scalar:/usr/src/app/data
runContainer oceantea-visualization-gateway -p 3333:3333 -v /dockervolumes/oceantea/api_config:/usr/src/app/config --link oceantea-auth-inst --link oceantea-time-series-conversion-inst --link oceantea-spatial-analysis-inst --link oceantea-vector-time-series-inst --link oceantea-scalar-time-series-inst
