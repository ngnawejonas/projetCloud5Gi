echo '============================================================'
echo 'BUILDING APACHE...'
echo '============================================================'
sudo docker build -t apache2:enspy apache
echo '============================================================'
echo 'BUILDING MYSQLSERVER...'
echo '============================================================'
sudo docker build -t mysqlserver:enspy mysqlserver
echo '============================================================'
echo 'BUILDING TOMCAT...'
echo '============================================================'
sudo docker build -t tomcat8jre8:enspy tomcat
#clean intermediary containers
docker rmi -f $(docker images|grep "<none>              <none>"|cut -c40-53)
