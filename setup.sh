#!/bin/sh

wget https://download.docker.com/linux/static/stable/x86_64/docker-17.12.1-ce.tgz
tar xzvf docker-17.12.1-ce.tgz
sudo cp docker/* /usr/bin/
sudo mv ~/docker.service /lib/systemd/system/docker.service
sudo systemctl start docker
sudo systemctl enable docker
sudo mv ~/swarm.sh  /var/lib/cloud/scripts/per-boot/.
sudo chmod +x /var/lib/cloud/scripts/per-boot/swarm.sh
