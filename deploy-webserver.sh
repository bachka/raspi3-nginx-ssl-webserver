#!/usr/bin/env sh

cd ~
sudo apt-get update
sudo apt-get -y install unzip git python3.5.*

echo "# custom adds starting here" >> .bashrc
echo "export LC_ALL='en_US.UTF-8'" >> .bashrc
echo "export LC_ALL='en_GB.UTF-8'" >> .bashrc && source .bashrc

sudo su
apt update -y && apt-get upgrade -y && exit

cd ~
git clone git@github.com:bachka/raspi3-nginx-ssl-webserver.git

mkdir -p /etc/letsencrypt/.well-known
cp ssl.nginx /etc/nginx/snippets/ssl.conf
cp cors-headers.nginx /etc/nginx/snippets/cors-headers.conf
cp routes.nginx /etc/nginx/conf.d/default.conf