#!/bin/bash

set -e

cd ~
git clone --recursive https://github.com/dmlc/xgboost
cd xgboost; make -j4

sudo apt-get install python-setuptools
cd python-package; sudo python setup.py install
