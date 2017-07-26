#!/bin/sh 

set -e

exec 2>&1

# Notebook
exec chpst -u ubuntu jupyter notebook --no-browser --port=8888 --ip=* --notebook-dir=/data/