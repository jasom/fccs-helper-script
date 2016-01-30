#!/bin/sh
BASE="$(readlink -f $(dirname $0))"
HTTP_EXTERNAL_PORT=8080
HTTP_INTERNAL_PORT=80
docker run -d --name fccs-mongrel2 \
    -v "$BASE/mongrel2-data:/usr/mongrel2/" \
    -e "MONGREL2_UID=fccs-public" \
    -p ${HTTP_EXTERNAL_PORT}:${HTTP_INTERNAL_PORT} \
    jasom/mongrel2

docker run -d --name fccs-redis \
    --net container:fccs-mongrel2 \
    -v "$BASE/redis-data:/data" \
    redis \
    redis-server --dbfilename dump.db --save 900 1 --save 300 5

docker run -d --name fccs-fccs \
    --net container:fccs-mongrel2 \
    -v "$BASE/fccs-data:/data" \
    jasom/fccs
