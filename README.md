Docker + Koa
============

## Installing Docker

* [Have docker installed](https://docs.docker.com/installation/)
* Be able to run docker without sudo

## build.sh

    ./build.sh

## up.sh

    ./up.sh

The script consists of one command:

    docker run -d -p 3000:3000 -v $(pwd):/app -w /app --name=koa koa

The docker run command creates a new docker container, which is an instance of a docker image. The image in the above command is the koa image we created above.
