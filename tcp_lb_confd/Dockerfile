FROM alpine

RUN apk update && \
    apk add haproxy curl

RUN cd /root && \
    wget https://github.com/kelseyhightower/confd/releases/download/v0.11.0/confd-0.11.0-linux-amd64 && \
    chmod 744 confd-0.11.0-linux-amd64 && \
    mv confd-0.11.0-linux-amd64 /usr/bin/confd

COPY etc/confd/ /etc/confd/

COPY start.sh /usr/local/bin/start.sh
RUN chmod 0744  /usr/local/bin/start.sh

CMD [ "/usr/local/bin/start.sh" ]
