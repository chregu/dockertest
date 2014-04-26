/usr/local/bin/docker run -d -i -t --name=front --link=app:app -p=82:80 -v=/tmp/:/var/www chregu/nginx /sbin/my_init --enable-insecure-key
