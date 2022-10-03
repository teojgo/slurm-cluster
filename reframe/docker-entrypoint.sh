#!/bin/bash

while [ ! -f /scratch/munge.key ]
do
  sleep 1
done

sudo cp /scratch/munge.key /etc/munge/munge.key
sudo service munge start

cd /scratch
rm -rf reframe
git clone https://github.com/reframe-hpc/reframe.git
cd reframe
./bootstrap.sh

cd /scratch/reframe
tempdir=$(mktemp -d -p /scratch)
TMPDIR=$tempdir ./test_reframe.py -v --rfm-user-config=/reframe/container_cluster.py
