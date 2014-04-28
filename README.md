# dockertest

This is just a test for me for docker. It uses

- [Docker.io](https://www.docker.io/) 
- [Ansible](http://www.ansible.com/home)
- [Fig](http://orchardup.github.io/fig/)
- [The Phusion baseimage](https://github.com/phusion/baseimage-docker) with Ubuntu 12.04

It starts two docker containers, one with nginx, the other with [hhvm](http://hhvm.com/)

If you have linux, you can ditch the whole vagrant part. "sudo fig up" should be enough for you, if you have installed Docker (on debian/ubtuntu "apt-get install docker.io")


# Start up

## Ansible

you need ansible locally, eg on OS X with homebrew
````
brew install ansible
````

(AFAIK ansible is not available on linux, so you're a little bit out of luck here. One solution would be to run ansible within vagrant)


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

# coreos

I played a little bit with [CoreOS](https://coreos.com/), but not much, you can find the service files needed in coreos/, move them somewhere into your system and do.

````
sudo systemctl enable ~/coreos/app.1.service
sudo systemctl enable ~/coreos/front.1.service
sudo systemctl start front.1.service
````
and it should run (tested with [this CoreOS Vagrant Box](https://github.com/coreos/coreos-vagrant))

## coreos and fleetctl

````
fleetctl enable coreos/full.1.service
fleetctl start full.1.service
fleetctl list-units
fleetctl enable coreos/full.2.service
fleetctl start full.2.service
fleetctl list-units
````
