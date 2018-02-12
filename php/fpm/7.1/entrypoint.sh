#!/bin/bash

# Enable xdebug
[[ x$XDEBUG_ENABLED =~ ^x(true|false)$ ]] || XDEBUG_ENABLED=false

if [ "$XDEBUG_ENABLED" == "true" ]; then
	docker-php-ext-enable xdebug
fi

php-fpm
