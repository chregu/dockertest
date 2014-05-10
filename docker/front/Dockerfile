FROM phusion/baseimage:0.9.9

ENV HOME /root

RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

RUN apt-get update

RUN chmod 755 /etc/container_environment
RUN chmod 644 /etc/container_environment.sh /etc/container_environment.json

RUN apt-get install -y -f nginx

CMD ["/sbin/my_init"]

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

ADD default /etc/nginx/sites-enabled/default

RUN mkdir -p /etc/my_init.d

ADD setup.sh /etc/my_init.d/setup.sh
RUN chmod +x /etc/my_init.d/setup.sh

RUN mkdir /etc/service/nginx
ADD nginx.runit /etc/service/nginx/run
RUN chmod a+x /etc/service/nginx/run

RUN apt-get clean && rm -rf /tmp/* /var/tmp/*




