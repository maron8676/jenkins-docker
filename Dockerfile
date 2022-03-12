FROM jenkins/jenkins:lts

USER root

## install docker
RUN apt-get update && apt-get -y install wget
RUN wget -O /tmp/docker.tgz https://download.docker.com/linux/static/stable/x86_64/docker-19.03.8.tgz
RUN tar -xzf /tmp/docker.tgz -C /tmp
RUN mv /tmp/docker/* /usr/bin/

## grant docker
ENV DOCKER_GROUP_GID 1001
RUN groupadd -o -g $DOCKER_GROUP_GID docker
RUN usermod -g docker jenkins

USER jenkins
