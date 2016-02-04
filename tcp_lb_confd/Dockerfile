FROM debian:jessie

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    	    haproxy \
    	    wget

RUN cd /root && \
    wget https://github.com/kelseyhightower/confd/releases/download/v0.11.0/confd-0.11.0-linux-amd64 && \
    chmod 744 confd-0.11.0-linux-amd64 && \
    mv confd-0.11.0-linux-amd64 /usr/bin/confd

RUN for link in $(find /lib/systemd/system -type l | grep wants); do rm $link; done

ADD confd.service /etc/systemd/system/
ADD journald.conf /etc/systemd/journald.conf
ADD system.conf /etc/systemd/system.conf
COPY etc/confd/ /etc/confd/

RUN for srv in /etc/systemd/system/confd.service \
    /lib/systemd/system/haproxy.service \
    /lib/systemd/system/systemd-journald.service; do ln -sf $srv /etc/systemd/system/multi-user.target.wants/; done

VOLUME [ "/sys/fs/cgroup" ]
CMD [ "/sbin/init" ]
