#! /bin/bash

cd /

export SU2_HOME=/data/SU2
export SU2_RUN=/usr/local/SU2/bin
export PATH=$PATH:$SU2_RUN
export PYTHONPATH=$PYTHONPATH:$SU2_RUN

sudo ln -s /usr/bin/python3 /usr/bin/python

cd /data/SU2

sudo chmod -R 0777 /data/SU2
