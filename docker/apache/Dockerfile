FROM ubuntu

MAINTAINER nj <ngnawejonas@gmail.com>

# Install latest updates
RUN apt-get update
RUN apt-get upgrade -y

# Install mysql client and server
RUN apt-get -y install apache2 libapache2-mod-jk

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

# Set Apache environment variables (can be changed on docker run with -e) 
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid 
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2 
ENV APACHE_SERVERNAME localhost 
ENV APACHE_DOCUMENTROOT /var/www/html

EXPOSE 80 

CMD ["/usr/sbin/apache2","-D","FOREGROUND"]
