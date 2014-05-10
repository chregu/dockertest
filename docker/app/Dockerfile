FROM phusion/baseimage:0.9.9

ENV HOME /root

RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

RUN apt-get update

RUN chmod 755 /etc/container_environment
RUN chmod 644 /etc/container_environment.sh /etc/container_environment.json

RUN apt-get install -y -f wget python-software-properties

RUN add-apt-repository ppa:mapnik/boost

RUN wget -O - http://dl.hhvm.com/conf/hhvm.gpg.key | apt-key add -
#RUN apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 5A16E7281BE7A449
#RUN apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 40976EAF437D05B5

RUN echo deb http://dl.hhvm.com/ubuntu precise main | sudo tee /etc/apt/sources.list.d/hhvm.list

RUN apt-get update


RUN apt-get install -y -f hhvm php5-cli curl

# Install composer
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

CMD ["/sbin/my_init"]


RUN mkdir -p /etc/my_init.d


RUN mkdir /etc/service/hhvm
ADD hhvm.runit /etc/service/hhvm/run
RUN chmod a+x /etc/service/hhvm/run

ADD info.php /var/www/info.php

RUN apt-get clean && rm -rf /tmp/* /var/tmp/*

EXPOSE 9000
