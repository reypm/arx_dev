FROM centos:centos6
MAINTAINER Reynier Perez <reynierpm@gmail.com>

ENV TERM=xterm

ARG INSTALL_WKHTMLTOPDF=no
ARG WKHTMLTOPDF_VERSION=latest
ARG INSTALL_PDFTK=no
ARG PDFTK_VERSION=latest
ARG PHP_VERSION=default

RUN yum update -y && \
    yum install -y epel-release && \
    yum install -y http://rpms.remirepo.net/enterprise/remi-release-6.rpm && \
    yum install -y \
        wget \
        xz \
        httpd \
        mod_ssl \
        php \
        php-mysql \
        php-mssql \
        php-pdo \
        php-gd \
        php-soap \
        php-mbstring \
        php-mcrypt \
        php-pear \
        php-soap \
        php-odbc \
        php-fpm \
        php-mcrypt \
        php-mbstring \
        php-dom \
        ghostscript \
        ImageMagick \
        php-devel \
        php-pecl-imagick \
        gcc \
        yum-plugin-remove-with-leaves && \
    yum clean all

COPY container-files /

RUN pecl install xdebug-2.2.7 && \
    find /tmp -name "*.sh" -exec chmod +x {} \; && \
    bash /tmp/install-pdftk.sh && \
    bash /tmp/install-wkhtmltopdf.sh && \
    bash /tmp/clean-container.sh

EXPOSE 80
WORKDIR /var/www/html
ENTRYPOINT bash -C '/entrypoint.sh';'bash'
