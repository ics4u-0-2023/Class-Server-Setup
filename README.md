# Class Server Setup

![Deban Server image](./images/debian%20_server.jpg)

Setup instructions for Debian server for high school classroom.

## Loading Debian

- my setup has 2 drives:
  - 1 for OS
  - 1 for /home directories

- setup hard drives and partions as follows:
  - ensure you have a "LARGE" swap file
  - DO NOT load any software, only a GUI (if you want)
![Debian Server Partition setup](./images/Debian_drive_partion_setup.jpg)

## After OS Loading Setup

- after the server is up and running the following changes
  - add mr-coxall user to sudo
    - ```sh
      usermod -aG sudo mr-coxall
      ```
  - allow root to login to GUI:
    - ```sh
      nano /etc/pam.d/gdm-password
      auth required pam_succeed_if.so user != root quiet
      ```
  - install openssh_server:
    - ```sh
      apt install openssh-server -y
      systemctl start ssh
      systemctl status ssh
      ```
    - add course groups
    - ```sh
      groupadd ICD2O
      groupadd ICS3U
      groupadd ICS4U
      ```
    - load appache2
    - ```sh
      sudo apt install apache2 -y
      ```
    - turn on user webpages for apache
    - ```sh
      a2enmod userdir
      systemctl restart apache2
      ```
    - update add user defaults
      - web directory
      - default file permissions
    - run adduser script to add in students
