FROM resin/rpi-raspbian:jessie
MAINTAINER Solomon Xie <solomonxiewise@gmail.com>

COPY config/sources-cn.list /etc/apt/sources.list
RUN apt-get update

# Compile dependencies to pip install lxml
RUN apt-get install gcc libxslt1-dev musl-dev && \
    pip install lxml

# Install python & pip
RUN apt-get install python3 && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3 get-pip.py 

# Install wsgidav & relative packages
RUN pip install --no-cache-dir wsgidav cheroot && \
    mkdir -p /var/wsgidav/config

COPY config/wsgidav.yaml /var/wsgidav/config/

VOLUME /var/wsgidav
EXPOSE 80

#CMD wsgidav --host 0.0.0.0 --port 8080 --root /var/wsgidav/ --no-config
CMD wsgidav -c /var/wsgidav/config/wsgidav.yaml
