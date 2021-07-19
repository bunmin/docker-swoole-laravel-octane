#!/usr/bin/env sh

echo "################################## Run nginx : insert envoirement variable to file config"

export DOLLAR='$'
envsubst < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf
nginx -g "daemon off;"