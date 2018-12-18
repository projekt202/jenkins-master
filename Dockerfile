FROM jenkins/jenkins:latest
LABEL maintainer="mstewart@riotgames.com"

USER root

RUN apt-get update && \
    apt-get install -y \
    python \
    python-pip \
    apt-transport-https \
    software-properties-common

RUN pip install awscli --upgrade --user
RUN apt-get clean

# Docker
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable" && \
    apt-get update && apt-get install -y docker-ce && \
    usermod -aG docker jenkins

# Set SUID to run docker as root
RUN chmod g+s /usr/bin/docker


# Prep Jenkins Directories

RUN mkdir /var/log/jenkins
RUN mkdir /var/cache/jenkins
RUN chown -R jenkins:jenkins /var/log/jenkins
RUN chown -R jenkins:jenkins /var/cache/jenkins
RUN chown -R jenkins:jenkins /usr/local
# RUN chown -R jenkins:jenkins /var/run/docker.sock
USER jenkins

# Set Defaults
ENV JAVA_OPTS="-Xmx8192m"
ENV JENKINS_OPTS="--handlerCountMax=300 --logfile=/var/log/jenkins/jenkins.log  --webroot=/var/cache/jenkins/war"
