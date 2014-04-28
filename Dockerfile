# this is for generating a docker with both hhvm and nginx in one container
# it also includes all the sources, so maybe to
# sudo fig run --rm app /bin/sh -c "cd /var/www && composer install"
# first
# you can start it
# /usr/local/bin/docker run -d -p=80:80 -i -t chregu/nginxhhvm /sbin/my_init  --enable-insecure-key

FROM chregu/hhvm

RUN apt-get update

RUN apt-get install -y -f nginx

CMD ["/sbin/my_init"]


RUN echo "daemon off;" >> /etc/nginx/nginx.conf

ADD docker/full/nginx-default /etc/nginx/sites-enabled/default

ADD docker/full/nginx.runit /etc/service/nginx/run
RUN chmod a+x /etc/service/nginx/run

ADD sources/ /var/www/


RUN apt-get clean && rm -rf  /tmp/* /var/tmp/*


