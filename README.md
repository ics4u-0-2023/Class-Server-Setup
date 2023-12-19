# Class Server Setup

![Deban Server image](./images/debian%20_server.jpg)

Setup instructions for Debian server for high school classroom.

## Loading Debian

- my setup has 2 drives:
  - 1 for OS
  - 1 for /home directories

- setup hard drives and partions as follows:
  - ensure you have a "LARGE" swap file
  - DO NOT load any software (web server, SSH, ...), only a GUI (if you want)
![Debian Server Partition setup](./images/Debian_drive_partion_setup.jpg)

## After OS Loading Setup

- after the server is up and running install the following, logged in as "root"!
  - update server packages
    - ```sh
      apt update && upgrade -y
      apt install curl -y
      ```
  - change ttyd font size
    - ```sh
      dpkg-reconfigure console-setup
      ```
- run the following setup script
  - ```sh
    curl -fsSL https://raw.githubusercontent.com/Mr-Coxall/Class-Server-Setup/main/setup.sh | bash
    ```
  - allow root to login to GUI (if you installed one!):
    - ```sh
      nano /etc/pam.d/gdm-password
      auth required pam_succeed_if.so user != root quiet
      ```
  - now test the PHP installation
    - ```sh
      echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php
      goto: http://your-server-ip/info.php
      ```
  - set a static IP address for the server
    - /etc/network/interfaces
      - # This file describes the network interfaces available on your system
        # and how to activate them. For more information, see interfaces(5).

        source /etc/network/interfaces.d/*

        # The loopback network interface
        auto lo
        iface lo inet loopback

        # The primary network interface
        allow-hotplug enp1s0
        iface enp1s0 inet static
          address 172.22.52.80
          netmask 255.255.255.0
          gateway 172.22.52.1
          dns-nameervers 8.8.8.8 8.8.4.4
  - update add user defaults
    - web directory
    - default file permissions
      - for apache2, the home directory must be 711
      - https://www.baeldung.com/linux/new-files-dirs-default-permission#:~:text=On%20Linux%2C%20by%20default%2C%20when,%2C%20and%20execute%20permissions%2C%20respectively.
    - set default .bashrc
      - in /etc/skel/.bashrc
    - for NOT ICS4U, set Fish as default Shell
      - Add the following to the end of ~/.config/fish/config.fish
        - starship init fish | source
    - force reset password
      - ```sh
        chage -d 0 user01
        ```
    - default shell
      - adduser --group ICD2O --shell /bin/fish first.last
      - adduser --group ICS4U --shell /bin/bash first.last
      - change group setting
        - sudo usermod -g www-data foobar
      - do not change for ICS4U students
      - usermod -s /usr/bin/fish student
      - add this line to their .config/fish/config.fish
        - starship init fish | source
  - run adduser script to add in students
    - ```sh
      useradd -m pcoxall
      ```
  - reboot server!
    - ```sh
      reboot now
      ```

## Setup Script

- run the following
  - ```sh
    curl -fsSL https://raw.githubusercontent.com/Mr-Coxall/Class-Server-Setup/main/setup.sh | bash
    ```
