# CentOS 7 + Oracle Java 8  + Hadoop 2.7.3

## Versions
- centos: **7**
- java: **1.8.0_111**
- hadoop: **2.7.3**

## Reference
- https://github.com/sequenceiq/hadoop-docker
- http://kiwenlau.com/2016/06/26/hadoop-cluster-docker-update-english/

## Reference Docker file
- https://github.com/sequenceiq/hadoop-docker

## Installation
```sh
docker pull prographerj/centos7-hadoop:latest
```

## Running
To simply run the container[bash]:
```sh
docker run -i -t --name master prographerj/centos7-hadoop:latest /bin/bash
```

To simply run the container[demons]:
```sh
docker run -i -t -d --name master prographerj/centos7-hadoop:latest /usr/local/hadoop/sbin/start-dfs.sh
```
