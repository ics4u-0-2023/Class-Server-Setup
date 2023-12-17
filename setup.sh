#!/usr/bin/env bash
# setup script for classroom server

# update server
apt update && upgrade -y

# Linux utilities to load and remove (terminal web servers)
apt install curl -y
apt install git -y
apt install gh -y
apt install tree -y
apt install neofetch -y
apt install podman -y
apt remove w3m -y
apt remove lynx -y

# SSH
apt install openssh-server -y
systemctl start ssh
# systemctl status ssh

# NeoVim
cd /tmp
apt-get install ninja-build gettext cmake unzip curl -y
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
make install

# Apache 2, PHP & MySQL
sudo apt install apache2 -y
a2enmod userdir
systemctl restart apache2
apt install php-fpm php-mysql -y
systemctl status php8.2-fpm
a2enmod proxy_fcgi setenvif
a2enconf php8.2-fpm
systemctl restart apache2
echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php

# GNU tools
apt install build-essential -y
gcc --version
g++ --version

# Bun for node and typescript
curl -fsSL https://bun.sh/install | bash
cp /root/.bun/bin/bun /usr/local/bin/
chmod a+x /usr/local/bin/bun
# should not have to do this any more
# source /root/.bashrc
bun --version

# Java
apt install default-jdk -y
java --version

# C#
apt install mono-devel -y
mcs --version
mono --version

# Go
apt install golang-go -y
go --version

# class groups
groupadd ICD2O
groupadd ICS3U
groupadd ICS4U
