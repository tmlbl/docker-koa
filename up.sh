#!/bin/sh

docker rm -f canary
docker run -d -p 3000:3000 -v $(pwd):/appi -w /app --name=canary tmlbl/koa

