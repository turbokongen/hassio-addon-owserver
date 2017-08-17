#!/bin/bash
set -e
email=$(jq -r '.email' /data/options.json)

mustache-cli /data/options.json /templates/vhost.mustache > /tmp/caddy.conf
export CADDYPATH=/ssl/caddy
caddy -agree -email "$email" -conf /tmp/caddy.conf
