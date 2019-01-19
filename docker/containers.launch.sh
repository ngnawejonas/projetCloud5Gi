#!/bin/bash

echo 'CLEANING CONTAINERS LIST FIRST'

sudo docker stop $(sudo docker ps -a|grep enspy|cut -c1-12)

sudo docker rm $(sudo docker ps -a|grep enspy|cut -c1-12)

echo 'STARTING CONTAINERS...'

sudo docker run -d --name enspy_apache_server apache2:enspy

echo 'APACHE STARTED'

sudo docker run -d --name enspy_dbserver mysqlserver:enspy

echo "MYSQL STARTED"

echo "$1 TOMCATS WILL LAUNCH SOON..."

for i in $(seq 1 $1);  do
	sudo docker run -d --name enspy_tomcat$i --link enspy_apache_server --link enspy_dbserver tomcat8jre8:enspy
	sleep 1s
	echo "TOMCAT No $i STARTED"
done

sh utils/apachehosts.script.sh $1
sh utils/httpd-jk.conf.script.sh $1
sh utils/workers.properties.script.sh $1
sh utils/server.xml.script.sh $1
rm server.xml workers.properties httpd-jk.conf hosts

echo "DONE"

sleep 2s
sudo docker ps |grep enspy

#launching the browser
ip=$(sh utils/container.getIP.sh enspy_apache_server)
sh utils/browser.launch.sh "http://$ip/annuaire"

