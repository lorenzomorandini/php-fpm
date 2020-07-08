FROM alpine:3.12

RUN apk --no-cache add su-exec==0.2-r1 nginx==1.18.0-r0 php7==7.3.19-r0 php7-fpm==7.3.19-r0 \
    \
    #     # forward request and error logs to docker log collector
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log \
    && ln -sf /dev/stderr /var/log/php7/error.log

COPY docker /docker/
COPY /docker/nginx.conf /etc/nginx/nginx.conf
COPY /docker/www.conf /etc/php7/php-fpm.d/www.conf

COPY . /src

WORKDIR /src

ENTRYPOINT ["/docker/entrypoint.sh"]
CMD ["nginx"]
