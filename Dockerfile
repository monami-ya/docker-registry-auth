FROM monami0ya/docker-baseimage:14.04

ENV DEBIAN_FRONTEND uninteractive
ENV SUBJECT "/C=/ST=/L=/O=/CN=common_name"

RUN apt-get update && \
    apt-get install -y openssl && \
    mkdir ssl logs && \
    openssl genrsa -out ssl/server.key 2048 && \
    openssl req -new -newkey rsa:4096 -days 3650 -nodes -subj $SUBJECT -keyout ssl/server.key -out ssl/server.csr && \
    /usr/bin/openssl x509 -req -days 365 -in ssl/server.csr -signkey ssl/server.key -out ssl/server.crt && \
    openssl x509 -outform PEM -in ssl/server.crt -out ssl/server.pem -text && \
    apt-get autoremove -y openssl && \
    apt-get clean

VOLUME /ssl

VOLUME /config
ADD config/auth_config.yml /config/

ENTRYPOINT [ "/sbin/my_init" ]    

