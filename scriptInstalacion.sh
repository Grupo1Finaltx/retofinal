#!/bin/bash
#actualizar sistema
sudo apt-get update
sudo apt-get upgrade -y

#instalacion de servicios para el servidor web en local
sudo apt-get install php7.1 -y
sudo apt-get install python-software-properties -y
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get install php7.1-mysql -y
sudo apt-get install apache2 -y
sudo apt-get install mysql-server -y
sudo apt-get install libapache2-mod-php7.1 -y
sudo apt-get install php7.1-json -y

#instalacion de github para poder realizar las copias de seguridad
sudo ap-get install git -y

cd /var/www/html

echo "Introduzca el nombre del repositorio a clonar"
read repositorio

git clone $repositorio
