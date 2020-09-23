#!/bin/sh
set -e

if [ -n "$ROUTER_NETWORK" ]; then
    iptables -A FORWARD -s "$ROUTER_NETWORK" -d 10.0.0.0/8,172.16.0.0/12,192.168.0.0/16 -j DROP
    iptables -t nat -A POSTROUTING -s "$ROUTER_NETWORK" -j SNAT --to-source "$(hostname -i)"
fi

ARGS="--conf-file=/run/config/dnsmasq.conf"
dnsmasq $ARGS --test

if [ -n "$DEBUG" ] && [ "$DEBUG" != "no" ]; then
    ARGS="$ARGS --no-daemon"
else
    ARGS="$ARGS --keep-in-foreground"
fi

ARGS="$ARGS --dhcp-leasefile=/var/lib/dnsmasq/leases.txt"

exec dnsmasq $ARGS "$@"
