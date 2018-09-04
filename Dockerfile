FROM php:7.2-apache
COPY src/ /var/www/html

RUN apt-get -y update
RUN apt-get -y install python3
RUN curl https://bootstrap.pypa.io/get-pip.py -o "get-pip.py"
RUN python3 get-pip.py
RUN pip install awscli
RUN apt-get -y install jq

ENV APACHE_CONFDIR /etc/apache2
ENV APACHE_ENVVRS /etc/apache2/envvars
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2

COPY init.sh /usr/local/bin/init.sh
RUN chmod u+x /usr/local/bin/init.sh

ENTRYPOINT ["/usr/local/bin/init.sh"]
