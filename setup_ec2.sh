#!/bin/bash

sudo apt-get update
sudo apt-get -y upgrade

# Python packages
sudo pip3 install -U -r requirements.txt

# Configure notebook
jupyter notebook --generate-config
echo "c.NotebookApp.password = u'sha1:72031bc85db3:5cc8788668627116eb35e779128ceeb45f4c055a'" >> ~/.jupyter/jupyter_notebook_config.py

# Keep notebook running
sudo apt-get install -y runit
sudo mkdir /etc/service
sudo ln -s ./runit/notebook /etc/service/notebook
