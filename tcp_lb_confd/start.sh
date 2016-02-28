#!/bin/sh

TIMEOUT=15
export PATH=/usr/bin:$PATH

while true
do
  for proc in confd haproxy
  do
	  case "$(pidof ${proc} | wc -w)" in
			0)
			if [ "$proc" == "haproxy" ]; then
				${proc} -f /etc/haproxy/haproxy.cfg &
			else
				${proc} &
			fi
				sleep ${TIMEOUT}
				;;
			1)  # all ok
				sleep ${TIMEOUT}
				;;
		esac
	done
done
