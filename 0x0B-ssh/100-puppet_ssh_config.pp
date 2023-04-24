#!/usr/bin/env bash
#practice using puppet to set up client SSH configuration file
#to login to a server without typing a password
ssh-keygen -t rsa -b 4096 -C "chukwuebukaedej@gmail.com" -f ~/.ssh/school
ssh-copy-id user@52.86.43.1
nano ~/.ssh/config
Host 52.86.43.1
IdentityFile ~/.ssh/school
PasswordAuthentication no
