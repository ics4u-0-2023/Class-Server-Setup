# Class Server Setup

![Deban Server image](./images/debian%20_server.jpg)

Setup instructions for Debian server for high school classroom.

## Loading Debian

- my setup has 2 drives:
  - 1 for OS
  - 1 for /home directories

- setup hard drives and partions as follows:
![Debian Server Partition setup](./images/Debian_drive_partion_setup.jpg)

## After OS Loading Setup

- after the server is up and running the following changes
  - add mr-coxall user to sudo
  - allow root to login to GUI:
    - ```sh
      nano /etc/pam.d/gdm-password
      auth required pam_succeed_if.so user != root quiet
      ```
    - add course groups
    - load appache2
    - turn on user webpages for apache
    - update add user defaults
      - web directory
      - default file permissions
    - run adduser script to ad in students
