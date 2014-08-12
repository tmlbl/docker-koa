#!/bin/sh

docker run -v $(pwd):/app -w /app --entrypoint /bin/sh koa /app/boot_test.sh

