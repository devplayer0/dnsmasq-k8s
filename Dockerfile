FROM alpine:3.12

RUN apk --no-cache add dnsmasq && \
    mkdir /var/lib/dnsmasq

COPY entrypoint.sh /

ENV DEBUG=no
ENTRYPOINT ["/entrypoint.sh"]
