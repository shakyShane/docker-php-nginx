#!/usr/bin/env bash

docker run --name php-fpm \
    -v /Users/shakyshane/docker/src:/var/www/html \
    -d php:7.0.4-fpm

docker run --name fpm-nginx \
    -p  8000:80 \
    -v $(pwd)/nginx:/etc/nginx/conf.d/ \
    -v /Users/shakyshane/docker/src:/var/www/html \
    --link php-fpm:php-fpm \
    -d nginx

echo "--> requesting index.php"
curl "$(docker-machine ip):8000/index.php"
echo ""
echo "--> requesting /"
curl "$(docker-machine ip):8000"
echo ""
echo "URL: $(docker-machine ip):8000"
