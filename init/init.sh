#! /bin/bash

cd /data/SU2_HOME

touch init_check

cd /home/nimbix

sudo cp -R /data/SU2_HOME /home/nimbix
sudo chown -R nimbix:nimbix /home/nimbix/SU2_HOME
sudo chmod -R 0777 /home/nimbix
