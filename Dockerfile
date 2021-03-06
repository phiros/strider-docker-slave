# DOCKER-VERSION 1.0.0

FROM ubuntu:14.04
MAINTAINER Keyvan Fatehi <keyvanfatehi@gmail.com>

RUN apt-get -y update

# Node.js and Git are required
RUN apt-get -y install nodejs npm git
RUN update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10

# git wants this
RUN locale-gen en_US.UTF-8

# Setup workspace and user
RUN adduser --home /home/strider --gecos "" strider
RUN mkdir -p /home/strider/workspace
RUN chown -R strider /home/strider

# Get the slave
RUN npm install -g strider-docker-slave@1.*.*
CMD strider-docker-slave

WORKDIR /home/strider/workspace
USER strider
ENV HOME /home/strider

# Other packages that people might want:
# - make
# - build-essential
# - python-dev
# - default-jre-headless
# - ruby

