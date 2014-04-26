/usr/local/bin/docker build -t chregu/nginx docker/front
/usr/local/bin/docker build -t chregu/hhvm docker/app
/usr/local/bin/docker build -t gaudi/db docker/db

#mkdir -p /tmp/.gaudi/mysql

/usr/local/bin/docker run -d -i -t --name=db -p=3306:3306 -v=/tmp/.gaudi/mysql:/var/lib/mysql gaudi/db
/usr/local/bin/docker run -d -i -t --name=app --link=db:db -p=9000:9000 -v=/tmp/:/var/www chregu/hhvm
/usr/local/bin/docker run -d -i -t --name=front --link=app:app -p=81:80 -v=/tmp/:/var/www chregu/nginx /sbin/my_init --enable-insecure-key

# docker stop $(docker ps -a -q)

# docker rm $(docker ps -a -q)


#docker rmi $(docker images -a | grep "^<none>" | awk '{print $3}')


# IM=$(docker ps | grep 'front:phusion' | awk '{print $1}') && docker stop $IM && docker rm $IM && docker build -t front:phusion . && /usr/local/bin/docker run -d -i -t --name=front --link=app:app -p=81:80 -v=/tmp/:/var/www front:phusion /sbin/my_init --enable-insecure-key

