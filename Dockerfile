FROM phusion/baseimage:0.9.16

MAINTAINER [Alejandro Baez](https://twitter.com/a_baez)

EXPOSE 7777

RUN apt-get update && \
    apt-get -yq upgrade && \
    apt-get -yq install \
    curl \
    git \
    npm \
    nodejs && \
    cd /usr/bin && ln -s nodejs node && \
    mkdir /etc/service/hastebin && \
    git clone -b custom https://github.com/abaez/haste-server.git /opt/haste && \
    apt-get -yq clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/*

WORKDIR /opt/haste

ADD add/config.js /opt/haste/
ADD add/static /opt/haste/static/
ADD add/hastebin.sh /etc/service/hastebin/run

RUN npm install
