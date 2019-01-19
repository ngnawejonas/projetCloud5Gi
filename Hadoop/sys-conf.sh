#!/bin/bash

# Exporter la variable JAVA_HOME
# export JAVA_HOME=/home/joel/install/jdk1.8.0_45
export JAVA_HOME="$1"

# Ajouter JAVA_HOME à la variable d'environnement
export PATH=$JAVA_HOME/bin:$PATH

# Exporter la variable HADOOP_HOME
# export HADOOP_HOME=/home/joel/install/hadoop-2.7.1
export HADOOP_HOME="$2"

# Ajouter le dossier bin de hadoop à la variable d'environnement
export PATH=$HADOOP_HOME/bin:$PATH

# Ajouter le dossier sbin de hadoop à la variable d'environnement
export PATH=$HADOOP_HOME/sbin:$PATH

# Ajouter l'archive tools.jar de java à la variable d'environnement
export HADOOP_CLASSPATH=$JAVA_HOME/lib/tools.jar

