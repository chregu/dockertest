NAME=$1;
if [ -z $NAME ]
   then
    echo "NO NAME given"
    exit 1
fi

IM=$(docker ps -a | grep "$NAME" | awk '{print $1}')

docker stop $IM
docker rm $IM
docker build -t $NAME .
bash rundocker.sh


