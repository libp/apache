FROM alpine:3.18

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories

RUN apk update ;\
    apk add --no-cache ca-certificates ;\
    apk add --no-cache curl bash tree tzdata busybox-extras openrc;\
    cp -rf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN apk add --no-cache apache2 apache2-lua  apache2-http2 apache2-ldap apache2-mod-wsgi apache2-proxy apache2-proxy-html apache2-ssl apache2-utils apache2-webdav

RUN ln -sf /dev/stdout /var/log/apache2/access_log \
&& ln -sf /dev/stderr /var/log/apache2/error_log

COPY httpd_forward.conf /etc/apache2/httpd.conf
CMD ["httpd", "-D", "FOREGROUND"]
WORKDIR /var/www/html/
EXPOSE 80


