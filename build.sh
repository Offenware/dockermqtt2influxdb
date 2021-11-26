#!/bin/bash

# version 2021-08-07 15:20

cd ~/dockermqtt2influxdb

if [ -n "$1" ]; then
  ex=$1
else
  rc=$(git remote show origin |  grep "local out of date" | wc -l)
  if [ $rc -ne "0" ]; then
    ex=true
  else
    ex=false
    echo "stop"
  fi
fi

if [ $ex == true ]; then
    git pull
    chmod +x build.sh

    docker image build -t offenware/mqtt2influxdb:latest .

    docker push offenware/mqtt2influxdb:latest

    sudo truncate -s 0 $(docker inspect --format='{{.LogPath}}' mqtt2influxdb)
    # testing: 

    echo "==========================================================="
    echo "=                                                         ="
    echo "=          docker run offenware/mqtt2influxdb                ="
    echo "=                                                         ="
    echo "==========================================================="
    # docker run offenware/mqtt2influxdb
fi

cd -
