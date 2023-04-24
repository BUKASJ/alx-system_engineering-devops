#!/usr/bin/env bash
#practice using puppet to set up client SSH configuration file
#to login to a server without typing a password
exec { 'echo':
  path    => 'usr/bin:/bin',
  command => 'echo "
  IdentityFile ~/.ssh/school
  PasswordAuthentication no" >> /etc/ssh/ssh_config',
  returns => [0,1],
}
