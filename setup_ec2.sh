#!/bin/bash

set -e

echo
echo "Starting"
echo
sudo apt-get update
sudo apt-get -y upgrade

echo
echo "Installing Python packages"
echo
sudo apt-get install -y python3-pip
sudo pip3 install -U -r requirements.txt

echo
echo "Configuring notebook"
echo
jupyter notebook --generate-config
echo "c.NotebookApp.password = u'sha1:72031bc85db3:5cc8788668627116eb35e779128ceeb45f4c055a'" >> ~/.jupyter/jupyter_notebook_config.py

echo
echo "Setting up runit notebook service"
echo
sudo apt-get install -y runit
sudo mkdir /etc/service
sudo ln -s /home/ubuntu/kaggle-ec2-setup/runit/notebook /etc/service/notebook

echo
echo "Setting up data volume"
echo
sudo mkdir /data
# sudo mkfs -t ext4 /dev/xvdf
# mount /dev/xvdf /data

if [ ! -e /etc/fstab.orig ]
then
  sudo cp /etc/fstab /etc/fstab.orig
fi
sudo echo "/dev/xvdf       /data   ext4    defaults,nofail        0       2" >> /etc/fstab
sudo mount -a
sudo chmod a+w /data
