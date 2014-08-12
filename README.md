Docker + Koa
============

## prerequisites

* [Have docker installed](https://docs.docker.com/installation/)

## build.sh

    docker build -t koa .

To create a docker container we need a docker image. Running the above command in this repository will build us an image that can execute node.js with the --harmony flag in order to run our koa application.

If you look at the [Dockerfile](https://github.com/tmlbl/docker-koa/blob/master/Dockerfile) for this project the comments explain what is happening here. Building your own image is fun, but the real power of docker is being able to upload and download versioned images, a lot like versioning code with git. For example, to download the latest version of this image, you can run the following command:

    docker pull tmlbl/koa

Because the repository tmlbl/koa has been uploaded to docker hub, you will be able to start downloading it immediately.

## up.sh

The script consists of one command:

    docker run -d -p 3000:3000 -v $(pwd):/app -w /app --name=koa koa

The docker run command creates a new docker container, which is an instance of a docker image. The image in the above command is the koa image we created above.
