Bienvenue dans ce projet sur hadoop.

Si vous voulez reproduire nous expérimentations, 
vous pouvez soit suivre toute la procédure telle que décrite dans le rapport,
ou simplemement utiliser les scripts fournis.

Dans le cas où vous voulez utiliser les scripts fournis, suivez la procdure suivante.

Nous supposons que vous disposez de Ubuntu > 12.04 et que vous avez installé 
tous les éléments cités comme prérequis dans notre rapport.

Il s'agit notamment de 
- java > 1.7
- ssh 

Suivez les étapes ci-dessous

	1. exécuter script sys-conf.sh de la manière suivante
	
		sh sys-conf.sh chemin_installation_java chemin_installation_hadoop
		ex : sh sys-conf.sh /usr/local/bin/jdk1.8.0_45 /usr/local/bin/hadoop-2.7.1

	2. exécuter le script prepare-hdfs.sh de la manière suivante

		sh prepare-hdfs.sh

	3. exécuter le script wc_simulation.sh de la manière suivante 

		sh wc_simulation.sh



Si l'un de ces scripts ne s'exécute pas correctement, vous tapez les unes après les 
autres les commandes qui s'y trouvent en les contextualisant à votre cas. Nous nous
sommes assurés que ces commandes sont très bien commentées. 
