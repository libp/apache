FROM centos:centos7
RUN yum install epel-release yum-utils -y \
    && yum install httpd -y \
    && yum install mod_ssl -y \
    && ln -sf /dev/stdout /etc/httpd/logs/access_log \
    && ln -sf /dev/stderr /etc/httpd/logs/error_log \
    && yum clean all
COPY httpd.conf /etc/httpd/conf/httpd.conf
CMD /usr/sbin/apachectl -k start "-DFOREGROUND"
WORKDIR /var/www/html/
EXPOSE 80

