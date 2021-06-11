#! /bin/bash

export SU2_HOME=/data/SU2
export SU2_RUN=/usr/local/SU2/bin
export PATH=$SU2_RUN:$PATH
export PYTHONPATH=$SU2_RUN:$PYTHONPATH

cd /data/SU2

sudo chmod -R 0777 /data/SU2
