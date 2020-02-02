FROM compose-base:latest

COPY ./docker/compose/client.ini /root/.coinevonet/coinevonet.ini

CMD ["/coinevonet"]
EXPOSE 1090/udp 1190/tcp
