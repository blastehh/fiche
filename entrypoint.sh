#!/bin/bash
# Fiche Start Script
#
if [ -z "$DOMAIN" ]; then
    DOMAIN="localhost"
fi
if [ -z "$BUFFER" ]; then
    BUFFER="5242880"
fi
if [ -z "$SLUG" ]; then
    SLUG="7"
fi
if [ -z "$SSL" ] || [ "$SSL" == "0" ]; then
  SSL_FLAG=""
else
  SSL_FLAG="-S"
fi
/usr/local/bin/fiche -d "$DOMAIN" -o /var/paste -l /var/log/paste/paste_log -B "$BUFFER" -s "$SLUG" -p 1111 "$SSL_FLAG"
