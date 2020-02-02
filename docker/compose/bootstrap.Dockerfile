FROM compose-base:latest

ENV COINEVONET_NETID=docker

COPY ./docker/compose/bootstrap.ini /root/.coinevonet/coinevonet.ini

CMD ["/coinevonet"]
EXPOSE 1090/udp 1190/tcp
