bin/bash


apt-get update -y && apt-get upgarde -y && apt full-upgrade -y
wget -O - https://raw.githubusercontent.com/OpenMediaVault-Plugin-Developers/installScript/master/install | sudo bash

systemctl enable nginx
