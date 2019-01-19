#!/bin/bash
echo '#------ worker list ------------------------------------------
worker.list=loadbalancer 
' > workers.properties
for i in $(seq 1 $1);  do
	j=$(($i + 1))	
        echo "# Worker $i
worker.worker$i.port=8009
worker.worker$i.host=enspy_tomcat$i
worker.worker$i.type=ajp13
worker.worker$i.lbfactor=1
worker.worker$i.redirect=worker$j
">>workers.properties
done

echo '# Load Balancer
worker.loadbalancer.type=lb'>>workers.properties
line='worker.loadbalancer.balance_workers'
for i in $(seq 1 $i); do 
   if [ $i -eq 1 ]; then
	line="$line=worker$i"
   else
	line="$line,worker$i"
   fi
done
echo $line >> workers.properties
echo 'worker.loadbalancer.sticky_session=1'>>workers.properties

#copy to apache server
cat workers.properties|sudo docker exec -i enspy_apache_server sh -c "cat > /etc/libapache2-mod-jk/workers.properties"
