#!/bin/bash
docker stop $(docker ps -a|grep enspy|cut -c1-12)
docker rm $(docker ps -a|grep enspy|cut -c1-12)
docker rmi -f $(docker images|grep enspy|cut -c40-53)
