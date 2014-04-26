# dockertest

This is just a test for me for docker. It uses

- [Docker.io](https://www.docker.io/) 
- [Ansible](http://www.ansible.com/home)
- [Fig](http://orchardup.github.io/fig/)
- [The Phusion baseimage](https://github.com/phusion/baseimage-docker) with Ubuntu 12.04

It starts two docker containers, one with nginx, the other with [hhvm](http://hhvm.com/)


# Start up

## Ansible

you need ansible locally, eg with
````
brew install ansible
````

## start vagrant and dockers

````
vagrant up
vagrant ssh
cd /vagrant
sudo fig up
````

And call

http://172.84.98.44:82/info.php

to check if it works (should output the HHVM version number and more stuff);

# Build new images and push to index.docker.io

````
sudo bash docker-build.sh
sudo fig up -d
sudo fig stop
sudo bash docker-commit-and-push.sh
````

# update images from index.docker.io

If the images on index.docker.io where updated and you don't build them yourself, you have to pull them before running fig up

````
sudo docker pull chregu/nginx
sudo docker pull chregu/hhvm
````

# ssh into running containers

````
sudo bash docker-ssh.sh chregu/hhvm
````

# start the silex example

````
sudo fig run --rm app /bin/sh -c "cd /var/www && composer install"
````

And call http://172.84.98.44:82/index.php/hello/foo
