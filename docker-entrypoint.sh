#!/bin/sh

set -e 

echo "$HTTPS_SERVER_CERT" > /public.crt
echo "$HTTPS_SERVER_PRIVATE_KEY" > /private.key

case "$1" in
    *.yaml|*.yml) set -- registry serve "$@" ;;
    serve|garbage-collect|help|-*) set -- registry "$@" ;;
esac

exec "$@"
