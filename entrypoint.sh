#!/bin/sh
set -e

ARGS="--conf-file=/run/config/dnsmasq.conf"
if [ -n "$DEBUG" ] && [ "$DEBUG" != "no" ]; then
    ARGS="$ARGS --no-daemon"
else
    ARGS="$ARGS --keep-in-foreground"
fi

exec dnsmasq $ARGS "$@"
