# Start up

## Ansible

you need ansible, eg with
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

