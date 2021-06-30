FROM alpine:3.14

RUN apk --no-cache add iptables dnsmasq && \
    mkdir /var/lib/dnsmasq

COPY entrypoint.sh /

ENV DEBUG=no \
    ROUTER_NETWORK=
ENTRYPOINT ["/entrypoint.sh"]
