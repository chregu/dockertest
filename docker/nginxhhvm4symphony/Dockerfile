# this is for generating a docker with both hhvm and nginx in one container
# it also includes all the sources, so maybe to
# sudo fig run --rm app /bin/sh -c "cd /var/www && composer install"
# first
# you can start it
# /usr/local/bin/docker run -d -p=80:80 -i -t chregu/nginxhhvm /sbin/my_init  --enable-insecure-key

FROM chregu/nginxhhvm

CMD ["/sbin/my_init"]

ADD nginx-default /etc/nginx/sites-enabled/default

ADD nginx.runit /etc/service/nginx/run
RUN chmod a+x /etc/service/nginx/run

RUN apt-get clean && rm -rf  /tmp/* /var/tmp/*


