FROM ubuntu:latest

RUN apt-get update
RUN apt-get -y upgrade

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install apache2 libapache2-mod-php7.0 php7.0-mysql php-gd php-apcu php7.0-curl php-xdebug

RUN a2enmod php7.0
RUN a2enmod rewrite

#Set up debugger
RUN echo "zend_extension=/usr/lib/php5/20131226/xdebug.so" >> /etc/php/7.0/apache2/php.ini
RUN echo "xdebug.remote_enable=1" >> /etc/php/7.0/apache2/php.ini
RUN echo "xdebug.remote_host=192.168.18.144" >> /etc/php/7.0/apache2/php.ini #Please provide your host (local machine IP)

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

EXPOSE 80

ADD apache-config.conf /etc/apache2/sites-enabled/000-default.conf

CMD /usr/sbin/apache2ctl -D FOREGROUND

RUN chmod 777 /var/www/html -R