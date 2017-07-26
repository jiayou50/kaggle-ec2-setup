#!/bin/sh 

set -e

exec 2>&1

# Data volume
mkdir /data
mount /dev/xvdf /data
chmod a+w /data

# Notebook
exec chpst -u ubuntu jupyter notebook --no-browser --port=8888 --ip=* --notebook-dir=/data/