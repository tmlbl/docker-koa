FROM debian:jessie
MAINTAINER tmlbl

# Apt-get update almost always has to be run
# so that the source lists will be populated for
# the container
RUN apt-get update

# We need curl to fetch the node.js binaries
RUN apt-get install -y curl

# I like putting my app in an /app folder
RUN mkdir -p /app

# Get a version of node that supports harmony
RUN curl http://\
nodejs.org/dist/v0.11.12/node-v0.11.12-linux-x64.tar.gz|\
tar -xzvf - --strip-components=1 -C /usr/local

# We copy the current directory into /app
ADD . /app

# Supervisor will restart the processes on file changes
# in our dev environment
RUN npm i -g supervisor

ENTRYPOINT /app/boot.sh
