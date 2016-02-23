FROM alpine

ENV DATA_DIR=/data

RUN apk update \
 && apk add bind \
 && rm -rf /var/cache/apk/*

ADD named.conf /etc/bind/named.conf

EXPOSE 53 53/udp
VOLUME ["${DATA_DIR}"]
ENTRYPOINT ["/usr/sbin/named", "-g"]
