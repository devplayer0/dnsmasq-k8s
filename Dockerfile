FROM alpine:3.12

RUN apk --no-cache add dnsmasq

COPY entrypoint.sh /

ENV DEBUG=no
ENTRYPOINT ["/entrypoint.sh"]
