FROM ubuntu:24.04
LABEL MAINTAINER="Philip Edwards <philip@gdcorner.com>"

#Install pre-reqs for jenkins
RUN apt-get update \
    && apt-get install --no-install-recommends -y openssh-server \
    && apt-get install -y default-jre \
    && apt-get install -y build-essential \
    && apt-get install -y git git-lfs \
    && rm -rf /var/lib/apt/lists/*

# Install some pre-reqs and ruby
RUN apt-get update \
    && apt-get install -y apt-utils build-essential \
    && apt-get install -y zlib1g zlib1g-dev \
    && apt-get install -y ruby ruby-dev \
    && apt-get install -y npm \
    && rm -rf /var/lib/apt/lists/*

# Install bundler
RUN gem install bundler

# Install jekyll-sass-converter to speed up builds
RUN gem install jekyll-sass-converter

# Install jsonlint
RUN npm install jsonlint -g

RUN chmod 777 -R /var/lib/gems/
RUN chmod 777 -R /usr/local/bin
