#!/bin/bash
sudo docker exec enspy_apache_server cat /etc/hosts > hosts

for i in $(seq 1 $i); do 
	ip=$(sh utils/container.getIP.sh enspy_apache_server)
	echo "$ip enspy_tomcat$i" >> hosts   
done
cat hosts|sudo docker exec -i enspy_apache_server sh -c "cat > /etc/hosts"
