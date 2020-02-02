ARG bootstrap="https://i2p.rocks/i2procks.signed"
FROM alpine:edge as builder

RUN apk update && \
    apk add build-base cmake git libcap-dev libcap-static libuv-dev libuv-static curl ninja bash binutils-gold curl-dev

WORKDIR /src/
COPY . /src/

RUN make NINJA=ninja STATIC_LINK=ON BUILD_TYPE=Release
RUN ./coinevonet-bootstrap ${bootstrap}

FROM alpine:latest

COPY coinevonet-docker.ini /root/.coinevonet/coinevonet.ini
COPY --from=builder /src/build/daemon/coinevonet .
COPY --from=builder /root/.coinevonet/bootstrap.signed /root/.coinevonet/

CMD ["./coinevonet"]
EXPOSE 1090/udp 1190/tcp
