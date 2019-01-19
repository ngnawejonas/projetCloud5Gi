#!/bin/bash

# Mettre le fichier duquel il faut compter les mots dans
# le système de fichiers hadoop
$HADOOP_HOME/bin/hdfs dfs -put $1 input

# Changer la taille des blocks du fichier
# $BLOCK_SIZE=$(($2*1024*1024))
$HADOOP_HOME/bin/hadoop fs -Ddfs.block.size=$(($2*1024*1024)) -cp -f input input

# Supprimer le repertoire "output" contenant éventuellement
# les résultats des précédentes exécutions de WordCount
$HADOOP_HOME/bin/hdfs dfs -rm -r hdfs:///user/joel/output

# Lancer le programme WordCount le fichier destination
# copié plus haut
$HADOOP_HOME/bin/hadoop jar wc.jar WordCount input output 

# Ranger les résultats du WordCount dans un fichier
exectime=$(cat "exec_time.txt")
#echo "$2,$3,$exectime" >> results
echo "$2,$exectime" >> results
