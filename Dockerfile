FROM docker.pkg.github.com/boristsr/docker-ssh-slave/docker-ssh-slave:latest
LABEL MAINTAINER="Philip Edwards <philip@gdcorner.com>"

# Install some pre-reqs and ruby
RUN apt-get update \
    && apt-get install -y zlib1g zlib1g-dev \
    && apt-get install -y ruby ruby-dev \
    && rm -rf /var/lib/apt/lists/*

# Intall bundler
RUN gem install bundler

ENTRYPOINT ["setup-sshd"]
