#!/bin/bash

while [ ! -f /scratch/munge.key ]
do
  sleep 1
done

sudo cp /scratch/munge.key /etc/munge/munge.key
sudo service munge start

cd /scratch
rm -rf reframe
git clone https://github.com/eth-cscs/reframe.git
cd reframe
./bootstrap.sh

#bash -c "$1"
while true
do
  sleep 1
done

