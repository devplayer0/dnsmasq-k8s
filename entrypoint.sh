#!/bin/sh
set -e

ARGS="--conf-file=/run/config/dnsmasq.conf"
dnsmasq $ARGS --test

if [ -n "$DEBUG" ] && [ "$DEBUG" != "no" ]; then
    ARGS="$ARGS --no-daemon"
else
    ARGS="$ARGS --keep-in-foreground"
fi

ARGS="$ARGS --dhcp-leasefile=/var/lib/dnsmasq/leases.txt"

exec dnsmasq $ARGS "$@"
