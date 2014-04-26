#!/bin/bash
IM=$(docker ps -a | grep "$1" | awk '{print $1}')
IP=$(docker inspect $IM | grep IPAddress |  awk '{print $2}' | sed 's/[\",]//g')
echo "Logging into $IP"
ssh -i insecure_key root@$IP
