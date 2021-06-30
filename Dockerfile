FROM alpine:3.14

RUN apk --no-cache add iptables dnsmasq && \
    mkdir /var/lib/dnsmasq

COPY entrypoint.sh /

ENV DEBUG=no \
    ROUTER_NETWORK=
ENTRYPOINT ["/entrypoint.sh"]

LABEL org.opencontainers.image.source https://github.com/devplayer0/dnsmasq-k8s
