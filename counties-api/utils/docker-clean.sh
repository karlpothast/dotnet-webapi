#!/bin/bash

docker stop counties-api
docker rm counties-api
docker image rm counties-api:latest
