#!/bin/bash
docker rm -ff `docker ps -a -q`
docker network rm allinone
rm -rf  /opt/Docker-Allinone/mongo_db1/data/*
rm -rf  /opt/Docker-Allinone/mysql_db1/data/*
rm -rf  /opt/Docker-Allinone/redis_db1/*
rm -rf  /opt/Docker-Allinone/consul_db1/data/*
rm -rf  /opt/Docker-Allinone/rmqnamesrv/logs/*
rm -rf  /opt/Docker-Allinone/rmqnamesrv/store/*
rm -rf  /opt/Docker-Allinone/rmqbroker/logs/*
rm -rf  /opt/Docker-Allinone/rmqbroker/store/*
rm -rf  /opt/Docker-Allinone/zkNodeA/zkdata/*
rm -rf  /opt/Docker-Allinone/zkNodeA/zkdatalog/*
rm -rf  /opt/Docker-Allinone/kafkaNodeA/kafdata/*
rm -rf  /opt/Docker-Allinone/kafkaNodeA/kafdatalog/*
