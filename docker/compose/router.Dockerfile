FROM compose-base:latest

COPY ./docker/compose/router.ini /root/.coinevonet/coinevonet.ini

CMD ["/coinevonet"]
EXPOSE 1090/udp 1190/tcp
