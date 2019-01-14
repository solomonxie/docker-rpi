FROM resin/rpi-raspbian:jessie
MAINTAINER solomonxie@foxmail.com

COPY sources.list /etc/apt/

RUN apt-get update
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install --assume-yes apt-utils
RUN apt-get install -y apache2 && \
    a2enmod dav dav_fs && \
    a2dissite 000-default

VOLUME /config

EXPOSE 80

VOLUME /var/www/webdav

CMD ["/config/run.sh"]
