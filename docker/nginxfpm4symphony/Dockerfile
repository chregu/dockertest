# this is for generating a docker with both hhvm and nginx in one container
# it also includes all the sources, so maybe to
# sudo fig run --rm app /bin/sh -c "cd /var/www && composer install"
# first
# you can start it
# /usr/local/bin/docker run -d -p=80:80 -i -t chregu/nginxhhvm /sbin/my_init  --enable-insecure-key

FROM chregu/nginx

# RUN apt-get update

RUN apt-get install -y -f php5-fpm php5-cli curl

CMD ["/sbin/my_init"]

ADD nginx-default /etc/nginx/sites-enabled/default

RUN mkdir -p /etc/my_init.d

RUN mkdir /etc/service/php-fpm
ADD php-fpm.runit /etc/service/php-fpm/run
RUN chmod a+x /etc/service/php-fpm/run

RUN sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php5/fpm/php-fpm.conf

RUN apt-get clean && rm -rf  /tmp/* /var/tmp/*


