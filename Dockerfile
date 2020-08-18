FROM boristsr/jenkins-ssh-slave:latest
LABEL MAINTAINER="Philip Edwards <philip@gdcorner.com>"

# Install some pre-reqs and ruby
RUN apt-get update \
    && apt-get install -y apt-utils build-essential \
    && apt-get install -y zlib1g zlib1g-dev \
    && apt-get install -y ruby ruby-dev \
    && rm -rf /var/lib/apt/lists/*

# Intall bundler
RUN gem install bundler

RUN chmod 777 -R /var/lib/gems/
RUN chmod 777 -R /usr/local/bin
