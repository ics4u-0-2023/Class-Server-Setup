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
      echo "<?php phpinfo(); ?>" | tee /var/www/html/info.php
      goto: http://your-server-ip/info.php
      ```
  - set a static IP address for the server
    - /etc/network/interfaces
      - ```sh
        allow-hotplug enp1s0
        iface enp1s0 inet static
          address 172.22.52.80
          netmask 255.255.255.0
          gateway 172.22.52.1
          dns-nameervers 8.8.8.8 8.8.4.4
        ```
  - update add user defaults
    - copy over the /etc/skel/ directory

    - default shell
      - adduser --ingroup ICD2O --shell /bin/fish --allow-bad-names -comment "First Last" first2.last2
      - adduser --ingroup ICS4U --shell /bin/bash --allow-bad-names -comment "First Last" first.last
      - run this
        - ```sh
          echo -e "starship init fish | source" >> ~/.config/fish/config.fish
          chmod 711 ~/first.last
          chage -d 0 first.last
          ```
