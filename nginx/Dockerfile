FROM alpine

RUN apk update \
 && apk add nginx \
 && apk add curl \
 &&  rm -rf /var/cache/apk/*

RUN ln -sf /dev/stdout /var/log/nginx/error.log \
 && ln -sf /dev/stdout /var/log/nginx/access.log

# Run nginx
# -----------------------------------------
EXPOSE 80
CMD ["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf", "-g", "daemon off;" ]
