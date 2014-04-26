IM=$(docker ps -a | grep "chregu/hhvm" | awk '{print $1}')

docker commit $IM -m "new build" chregu/hhvm
docker push chregu/hhvm


IM=$(docker ps -a | grep "chregu/nginx" | awk '{print $1}')

docker commit $IM -m "new build" chregu/nginx
docker push chregu/nginx
