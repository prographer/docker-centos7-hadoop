#!/bin/bash
if [ "$#" != 2 ]; then
    echo "Illegal number of parameters"
    echo "run.sh containerName imageName:version"
else
    docker run -i -t -h master --rm --name $1 -p 50070:50070 -p 8088:8088  $2
fi
