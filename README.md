Docker + Koa
============

## prerequisites

* [Have docker installed](https://docs.docker.com/installation/)

## build.sh

RUN:

    docker build -t koa .

To create a docker container we need a docker image. Running the above command in this repository will build us an image that can execute node.js with the --harmony flag in order to run our koa application. The build command looks for a Dockerfile in the current directory. Here is our Dockerfile:

````
FROM debian:jessie
# The FROM command specifies a local or pull-able image
# to use as a "base" for the new image. Subsequent commands
# will add "layers" to the final image

MAINTAINER tmlbl
# It is good practice to sign your images like this

RUN apt-get update
# Apt-get update almost always has to be run. Because you
# are starting with a very basic system, you must populate
# the source lists for your package manager in order to be 
# able to download and install packages

RUN apt-get install -y curl
# We'll use the unix utility curl to download the node.js
# binaries

RUN mkdir -p /app
# We're going to put our app's code in the /app folder

RUN curl http://\
nodejs.org/dist/v0.11.12/node-v0.11.12-linux-x64.tar.gz|\
tar -xzvf - --strip-components=1 -C /usr/local
# 0.11.12 is the recommended node version for running koa

ADD . /app
# The ADD command copies the contents of the current 
# directory (.) into the specified folder in the image

RUN npm i -g supervisor
# The node tool supervisor is a little too squirrely for
# production use, but can effectively crash and restart our
# node process on file changes during development

ENTRYPOINT /app/boot.sh
# A container's ENTRYPOINT is the command that will be 
# executed when a container instance of the image is 
# started. Since we mounted an executable shell script
# into the /app folder, we can use it to "boot" our container
````

Building your own image is fun, but the real power of docker is being able to upload and download versioned images, a lot like versioning code with git. For example, to download the latest version of this image, you can run the following command:

    docker pull tmlbl/koa

Because the repository tmlbl/koa has been uploaded to docker hub, you will be able to start downloading it immediately. The docker team maintains the docker hub and offers premium accounts, but it is also possible to create your own docker hub by running the docker-registry container and configuring docker to use that endpoint.

## up.sh

RUN:

    docker run -d -p 3000:3000 -v $(pwd):/app -w /app --name=koa koa

The docker run command creates a new docker container, which is an instance of a docker image. The image in the above command is the koa image we created above. Let's go through the flags one by one.

`-d`

Runs the container in daemon mode, freeing up the current terminal

`-p 3000:3000`

Maps the virtual port 3000 on the container to port 3000 on the host machine.

`-v $(pwd):/app`

Mounts the data volume of the current directory, represented by the output of the `pwd` command, into the /app directory of the container. Changes we make to files in the current directory will now be instantly reflected inside of the container

`-w /app`

Sets the working directory inside the container to /app. Though we use an absolute path to start supervisor, it throws errors when trying to restart the script unless this is set.

`--name=koa`

This assigns a unique string identifier to our container. When running further docker commands, we can specify this container by the name "koa". By default, docker containers are given a unique alphanumeric identifier, but it is much more useful to assign them readable names. For example, we can now run:

`docker logs -f koa`

Which will follow the tail of stdout from the container.
