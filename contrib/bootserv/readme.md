# coinevonet-bootserv

cgi executable for serving a random RC for bootstrap from a nodedb

## configuring

copy the example config (privileged)

    # cp configs/coinevonet-bootserv.ini /usr/local/etc/coinevonet-bootserv.ini
    
edit config to have proper values, 
specifically  make sure the `[nodedb]` section has a `dir` value that points to a static copy of a healthy nodedb

## building

to build:

    $ make

## installing (priviledged)

install cgi binary:

    # cp coinevonet-bootserv /usr/local/bin/coinevonet-bootserv 

set up with nginx cgi:

    # cp configs/coinevonet-bootserv-nginx.conf /etc/nginx/sites-available/coinevonet-bootserv.conf
    # ln -s /etc/nginx/sites-available/coinevonet-bootserv.conf /etc/nginx/sites-enabled/ 

## maintainence

add the following to crontab

    0 0 * * * /usr/local/bin/coinevonet-bootserv --cron
