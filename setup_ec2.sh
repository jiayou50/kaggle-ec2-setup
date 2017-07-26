#!/bin/bash

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
sudo ln -s ./runit/notebook /etc/service/notebook
