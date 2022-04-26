FROM php:7.4-cli-alpine

LABEL maintainer "Serhii Boremchuk <sebor@smile.fr>"
LABEL version="v1.0.9"

USER root
ENV HOME '/root'

RUN apk add --update --no-cache \
  bash \
  binutils \
  ca-certificates \
  coreutils \
  curl \
  findutils \
  git \
  libuser \
  linux-headers \
  ncurses \
  openssl \
  openssh \
  php7-pcntl \
  php7-posix \
  util-linux \
  zlib-dev \
  && rm -rf /var/cache/apk/*

RUN docker-php-ext-install pcntl posix

# change default shell from ash to bash
RUN sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd

COPY magento-cloud.sh $HOME
RUN chmod +x $HOME/magento-cloud.sh &&\
    bash $HOME/magento-cloud.sh

# Setup SSH client
RUN mkdir -p ${HOME}/.ssh
## Skip host key verification
RUN echo "Host *" >> ${HOME}/.ssh/config && \
    echo "    StrictHostKeyChecking no" >> ${HOME}/.ssh/config && \
    echo "Host *.magento.cloud *.magentosite.cloud" >> ${HOME}/.ssh/config && \
    echo "    UpdateHostKeys no" >> ${HOME}/.ssh/config

# Set working directory
WORKDIR ${HOME}
