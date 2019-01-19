#!/bin/bash

# Supprimer le contenu du répertoire /tmp,
# Répertoire temporaire par défaut de hadoop
sudo rm -R /tmp/*

# Formater le système de fichiers hadoop
$HADOOP_HOME/bin/hdfs namenode -format

# Créer le répertoire /user dans le 
# système de fichiers hadoop
$HADOOP_HOME/bin/hdfs dfs -mkdir /user

# Créer le répertoire /user/{username} dans le 
# système de fichiers hadoop
$HADOOP_HOME/bin/hdfs dfs -mkdir /user/$USER

# Lancer hadoop 
sh $HADOOP_HOME/sbin/start-dfs.sh
