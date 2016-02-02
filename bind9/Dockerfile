FROM debian:jessie
MAINTAINER cjr@cruwe.de

ENV DATA_DIR=/data

RUN apt-get update \
 && apt-get install -y bind9 \
 && apt-get clean

EXPOSE 53/udp
VOLUME ["${DATA_DIR}"]
ENTRYPOINT ["/usr/sbin/named", "-g"]
