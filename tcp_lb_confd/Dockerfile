FROM debian:jessie

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    	    haproxy


RUN cd /root && \
    wget https://github.com/kelseyhightower/confd/releases/download/v0.11.0/confd-0.11.0-linux-amd64 && \
    chmod 744 confd-0.11.0-linux-amd64 && \
    mv confd-0.11.0-linux-amd64 /usr/bin

ADD confd.service /etc/systemd/system/
COPY etc/confd/ /etc/confd/

RUN for link in $(find /lib/systemd/system -type l | grep wants); do rm $link; done
RUN for srv in haproxy.service confd.service ; do ln -sf /etc/systemd/system/$srv /etc/systemd/system/multi-user.target.wants/$srv ; done

VOLUME [ "/sys/fs/cgroup" ]
CMD [ "/sbin/init" ]
