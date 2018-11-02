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

#certbot -d bachka.de \
#    -d *.bachka.de \
#    --email ichinnorovb@gmail.com \
#    --text --agree-tos --server https://acme-v02.api.letsencrypt.org/directory - manual - priority-challenges dns \
#    --expand --renew-by-default \
#    --manual-public-ip-logging-ok certonly
#
#certbot certonly \
#    --manual \
#    -d *.bachka.de \
#    -d bachka.de \
#    --preferred-challenges dns-01 \
#    --server https://acme-v02.api.letsencrypt.org/directory
#
#
## removing unused ssl certs
## made a backup first
#sudo cp /etc/letsencrypt/ /etc/letsencrypt.backup -r
## deleted the ‘no longer needed domains’
#sudo rm -rf /etc/letsencrypt/live/bachka.de
#sudo rm -rf /etc/letsencrypt/renewal/bachka.de.conf
#sudo rm -rf /etc/letsencrypt/archive/bachka.de
#sudo rm -rf /etc/letsencrypt/live/bachka.de-0001
#sudo rm -rf /etc/letsencrypt/renewal/bachka.de-0001.conf
#sudo rm -rf /etc/letsencrypt/archive/bachka.de-0001
