# pycoinevonet

coinevonet with python 3

    # python3 setup.py install

## bootserv

bootserv is a bootstrap server for accepting and serving RCs

    $ gunicorn -b 0.0.0.0:8000 pycoinevonet.bootserv:app

## pycoinevonet instance

obtain `libcoinevonet-shared.so` from a coinevonet build

run (root):
    
    # export COINEVONET_ROOT=/tmp/coinevonet-instance/
    # export COINEVONET_LIB=/path/to/libcoinevonet-shared.so
    # export COINEVONET_BOOTSTRAP_URL=http://bootserv.ip.address.here:8000/bootstrap.signed
    # export COINEVONET_PING_URL=http://bootserv.ip.address.here:8000/ping
    # export COINEVONET_SUBMIT_URL=http://bootserv.ip.address.here:8000/
    # export COINEVONET_IP=public.ip.goes.here
    # export COINEVONET_PORT=1090
    # export COINEVONET_IFNAME=eth0
    # python3 -m pycoinevonet