#!/bin/bash
if [ "$#" != 2 ]; then
    echo "Illegal number of parameters"
    echo "run-master.sh imageName:version [-bash, -d]"
else
    if [[ $2="-bash" ]]; then
        docker run -i -t -h master --name master -p 50070:50070 -p 8088:8088  $1 /bin/bash
    elif [[ $2='-d' ]]; then
        docker run -i -t -d -h master --name master -p 50070:50070 -p 8088:8088  $1 /usr/local/hadoop/sbin/start-dfs.sh
    fi
fi
