#!/bin/sh
# copy a coinevonet binary into this cluster
cp ../../coinevonet .
# generate default config file
./coinevonet -g -r coinevonet.ini
# make seed node
./makenode.sh 1
# establish bootstrap
ln -s coinevo1/self.signed bootstrap.signed
