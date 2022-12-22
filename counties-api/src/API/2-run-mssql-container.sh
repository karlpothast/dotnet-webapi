#!/bin/sh

echo "checking docker status"
service docker status
sleep 3

echo "setting up mssql2022 docker container within this docker container (dind)"
docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=seq1erverTw3nyyTwo" -p 1433:1433 --name sqld >
sleep 2

echo "mssql server docker setup complete"

docker ps

