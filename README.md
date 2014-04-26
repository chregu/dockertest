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
sudo fig up
sudo fig down
sudo bash docker-commit-and-push.sh
````

