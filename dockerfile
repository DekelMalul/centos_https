FROM centos:7
RUN yum update -y && yum install -y httpd \
    mod_ssl
COPY apache-selfsigned.crt /etc/ssl/certs/apache-selfsigned.crt
COPY apache-selfsigned.key /etc/ssl/private/apache-selfsigned.key
COPY ssl.conf /etc/httpd/conf/ssl.conf
COPY httpd-foreground /usr/local/bin/httpd-foreground
EXPOSE 443
CMD httpd-foreground 

