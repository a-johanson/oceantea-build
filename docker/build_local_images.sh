#!/bin/bash

echo "Cleaning up build files..."
rm -rf ./build
mkdir ./build
cd ./build

function createImage {
    if [[ "$(docker images -q $1 2> /dev/null)" == "" ]]; then
        echo "Cloning repo $1..."
        git clone https://github.com/a-johanson/$1.git
        read -p "Make changes to the repository as required. Press enter to continue..." ignore_input_variable
        echo "Building image $1..."
        docker build -t $1 ./$1/
    else 
        echo "Image $1 already exists"
    fi
}

createImage oceantea-auth
createImage oceantea-time-series-conversion
createImage oceantea-vector-time-series
createImage oceantea-scalar-time-series
createImage oceantea-visualization-gateway
