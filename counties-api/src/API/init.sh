#!/bin/sh

echo "sourcing .profile"
source $HOME/.profile
sleep 2

echo "running openrc"
openrc
sleep 2

echo "starting docker service"
service docker start
sleep 2

#if exists in docker ps -a
#echo "starting sqld container"
#docker start sqld
#echo "init complete"




