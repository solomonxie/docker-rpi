FROM resin/rpi-raspbian:jessie
MAINTAINER Solomon Xie <solomonxiewise@gmail.com>

RUN apt-get update && \
    apt-get install python3 && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3 get-pip.py 
RUN pip install --no-cache-dir wsgidav cheroot

EXPOSE 80
RUN mkdir -p /var/wsgidav
VOLUME /var/wsgidav

CMD wsgidav -c /var/wsgidav/config/wsgidav.yaml
