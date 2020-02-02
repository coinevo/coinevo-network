#!/bin/bash
set +x
cd coinevo1
nohup ./coinevonet1 $PWD/coinevonet.ini &
# seed node needs some time to write RC to make sure it's not expired on load for the rest
sleep 1
cd ../coinevo2
nohup ./coinevonet2 $PWD/coinevonet.ini &
cd ../coinevo3
nohup ./coinevonet3 $PWD/coinevonet.ini &
cd ../coinevo4
nohup ./coinevonet4 $PWD/coinevonet.ini &
cd ../coinevo5
nohup ./coinevonet5 $PWD/coinevonet.ini &
cd ..
tail -f coinevo*/nohup.out
