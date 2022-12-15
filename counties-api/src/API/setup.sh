#!/bin/sh

echo "running openrc"
openrc
sleep 2

echo "starting docker service"
service docker start
sleep 2

echo "setting up sql2022 container within docker (dind)"
docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=seq1erverTw3nyyTwo" -p 1433:1433 --name sqld --hostname sqld -d karlpothast/mssqld2022:v0.1
sleep 2

echo "sql setup complete"



