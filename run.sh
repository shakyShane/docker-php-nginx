#!/usr/bin/env bash

docker run --name php-fpm -v /Users/shakyshane/docker/src:/var/www/html -d sh/php
docker run --name fpm-nginx -p 80:80 -v $(pwd):/etc/nginx/conf.d/ -d --link php-fpm:php-fpm nginx
