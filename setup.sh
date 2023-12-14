#!/usr/bin/env bash
# setup script for classroom server

apt update && upgrade -y

apt install curl -y
apt install git -y
apt install gh -y
apt install tree -y
apt install neofetch -y
apt install podman -y
apt remove w3m -y
apt remove lynx -y

apt install openssh-server -y
systemctl start ssh
systemctl status ssh

cd /tmp
apt-get install ninja-build gettext cmake unzip curl
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
make install

sudo apt install apache2 -y
a2enmod userdir
systemctl restart apache2
apt install php-fpm php-mysql -y
systemctl status php8.2-fpm
a2enmod proxy_fcgi setenvif
a2enconf php8.2-fpm
systemctl restart apache2
echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php

apt install build-essential -y
gcc --version
g++ --version

curl -fsSL https://bun.sh/install | bash
source /root/.bashrc
bun --version

apt install default-jdk -y
java --version

apt install mono-devel -y
mcs --version
mono --version

apt install golang-go -y
go --version

groupadd ICD2O
groupadd ICS3U
groupadd ICS4U

