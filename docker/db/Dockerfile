FROM ubuntu:14.04

# Update apt-get
RUN apt-key update
RUN apt-get -y update
RUN apt-get -y install nano git-core curl openssl libssl-dev wget

# User defined apt packets





# Install mysql
RUN apt-get -y --force-yes install mysql-server

# Edit mysql config (use root as user to be able to write in docker mounted volumes)
RUN sed -i -e "s/^user\s*=\s*mysql/user = root/" /etc/mysql/my.cnf
RUN sed -i -e "s/^bind-address\s*=\s*127.0.0.1/bind-address\t\t= 0.0.0.0/" /etc/mysql/my.cnf

# Add setup script
ADD setup.sh /root/setup.sh
RUN chmod +x /root/setup.sh

# Add custom setup script




		RUN echo 'mysql -e "CREATE DATABASE symfony CHARACTER SET utf8 COLLATE utf8_general_ci;" -uroot' > /root/after-setup.sh


	RUN chmod +x /root/after-setup.sh



CMD  /bin/bash /root/setup.sh \
    && /etc/init.d/mysql start \
     && /bin/bash /root/after-setup.sh \
    && /bin/bash

