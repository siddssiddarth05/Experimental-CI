#!/bin/bash
sudo apt-get update
echo "hi sid"

sudo apt-get install language-pack-en
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
echo "deb http://pkg.jenkins-ci.org/debian binary/" | sudo tee -a /etc/apt/sources.list.d/jenkins.list
sudo apt-get update
sudo apt-get install jenkins


sudo apt-get install apache2
sudo a2enmod proxy
sudo a2enmod proxy_http
sudo touch /etc/apache2/sites-available/jenkins.conf
sudo echo '<VirtualHost *:80>
    ServerName HOSTNAME
    ProxyRequests Off
    <Proxy *>
        Order deny,allow
        Allow from all
    </Proxy>
    ProxyPreserveHost on
    ProxyPass / http://localhost:8080/
</VirtualHost>' | sudo tee -a /etc/apache2/sites-available/jenkins.conf

