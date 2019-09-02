#!/bin/bash

#创建网络
docker network create --driver bridge --subnet 172.23.0.0/24 --gateway 172.23.0.1  allinone

#创建容器
docker-compose up -d 

#zookeeper+kafka初始化
docker exec -it  zkNodeA  /bin/bash -c "mkdir -p /opt/zkcluster/zookeeper/zkdata && echo "1" > /opt/zkcluster/zookeeper/zkdata/myid && cd /opt/zkcluster/zookeeper/bin  && ./zkServer.sh start"

docker exec -it  kafkaNodeA  /bin/bash -c "cd /opt/kafkacluster/kafka/ && bin/kafka-server-start.sh -daemon config/server.properties"

#Mongo导入数据
docker exec -it mongo_db1 mongorestore   -umoxi -pmoxi1234 -d admin --dir /backup/admin/
docker exec -it mongo_db1 mongorestore   -umoxi -pmoxi1234 -d mx_game  --dir /backup/mx_game/
docker exec -it mongo_db1 mongorestore   -umoxi -pmoxi1234 -d mx_game_dev --dir /backup/mx_game_dev/
docker exec -it mongo_db1 mongorestore   -umoxi -pmoxi1234 -d game_client --dir /backup/game_client/
docker exec -it mongo_db1 mongorestore   -umoxi -pmoxi1234 -d game_client_dev --dir /backup/game_client_dev/
docker exec -it mongo_db1 mongorestore   -umoxi -pmoxi1234 -d register_center --dir /backup/register_center/
docker exec -it mongo_db1 mongorestore   -umoxi -pmoxi1234 -d register_center_dev --dir /backup/register_center_dev/

#redis设置密码
docker exec -it redis_db1  redis-cli   -p 6379 config set requirepass moxi1234 

exit
