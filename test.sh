#!/bin/sh

docker run -v $(pwd):/app --name koa_test -w /app --entrypoint /bin/sh koa /app/boot_test.sh
docker rm koa_test

