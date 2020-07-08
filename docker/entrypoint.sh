#!/bin/sh
set -e

if [[ "$1" = "php-fpm" ]]; then
    exec su-exec www-data php-fpm7 -F;
elif [[ "$1" = "nginx" ]]; then
    exec nginx -g "daemon off;"
fi

exec "$@"
