#!/bin/bash

# the default node number is 3
N=${1:-3}

echo "check docker network."
if  ! docker network ls | grep -q 'hadoop'; then
    echo " - create docker network."
    docker network create --driver=bridge hadoop
else
    echo " - exist hadoop network"
fi

# start hadoop master container
echo " - remove exist hadoop-master container..."
docker rm -f hadoop-master &> /dev/null
echo " + start hadoop-master container..."
docker run -itd \
                --net=hadoop \
                -p 50070:50070 \
                -p 8088:8088 \
                -p 9000:9000 \
                --name hadoop-master \
                --hostname hadoop-master \
                hadoop:1.0 &> /dev/null


# start hadoop slave container
i=1
while [ $i -lt $N ]
do
    echo " - remove exist hadoop-slave$i container..."
	docker rm -f hadoop-slave$i &> /dev/null
	echo " + start hadoop-slave$i container..."
	docker run -itd \
	                --net=hadoop \
	                --name hadoop-slave$i \
	                --hostname hadoop-slave$i \
	                hadoop:1.0 &> /dev/null
	i=$(( $i + 1 ))
done

# get into hadoop master container
docker exec -it hadoop-master bash
