#!/bin/bash

docker stop boilerplate-api
sleep 3
docker rm boilerplate-api
sleep 3
docker image rm boilerplate-api:local

