FROM alpine

RUN apk update && \
    apk add wget curl

RUN cd /root && \
    wget https://github.com/kelseyhightower/confd/releases/download/v0.11.0/confd-0.11.0-linux-amd64 && \
    chmod 744 confd-0.11.0-linux-amd64 && \
    mv confd-0.11.0-linux-amd64 /usr/bin/confd

COPY etc/confd/ /etc/confd/

VOLUME /etc/haproxy

CMD [ "/usr/bin/confd" ]
