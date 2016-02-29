FROM alpine

RUN apk update && \
    apk add haproxy curl

RUN curl -L https://github.com/kelseyhightower/confd/releases/download/v0.12.0-alpha3/confd-0.12.0-alpha3-linux-amd64 -o /usr/bin/confd && \
	chmod 744 /usr/bin/confd

COPY etc/confd/ /etc/confd/

CMD [ "/usr/bin/confd" ]
