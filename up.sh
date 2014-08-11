#!/bin/sh

docker run -d -p 3000:3000 -v $(pwd):/app -w /app --name=koa koa

