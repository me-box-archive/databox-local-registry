#!/bin/sh

set -e 

echo "--------------------------------" 
echo "$HTTP_TLS_CERTIFICATE" 
echo "--------------------------------" 

echo "$HTTP_TLS_CERTIFICATE" > /public.crt
echo "$HTTP_TLS_KEY" > /private.key

case "$1" in
    *.yaml|*.yml) set -- registry serve "$@" ;;
    serve|garbage-collect|help|-*) set -- registry "$@" ;;
esac

exec "$@"
