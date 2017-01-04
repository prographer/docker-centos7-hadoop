#!/bin/bash

if [ "$#" != 2 ]; then
    echo "Illegal number of parameters"
    echo "run) build.sh tagName version"
else
    echo $1:$2
    docker build --tag $1:$2 .
fi
