#!/bin/sh

echo "stopping docker service"
service docker stop
sleep 3

echo "starting docker service"
service docker start
sleep 3

echo "checking docker status"
service docker status
sleep 3