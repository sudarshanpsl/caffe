#!/bin/bash  
if [[ $(uname -m) == "ppc64le" ]]; then    
  echo 'deb http://ftp.unicamp.br/pub/ppc64el/ubuntu/14_04/docker-1.6.2-ppc64el/ trusty main' | sudo tee /etc/apt/sources.list.d/trusty-docker.list    
  sudo apt-get update    
  sudo apt-get install -y --force-yes docker.io  
fi  
docker info  
docker build -t test -f Dockerfile.`uname -m` .  
docker run -i -v $(pwd):/source2 --rm test
