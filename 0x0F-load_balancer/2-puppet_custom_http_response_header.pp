#!/usr/bin/env bash
# This script configures Puppet to create a custom HTTP header response

echo "class custom_header {
  package { 'nginx':
    ensure => installed,
  }

  file { '/etc/nginx/sites-available/default':
    content => 'server {
        listen 80 default_server;
        listen [::]:80 default_server;

        root /var/www/html;

        index index.html index.htm index.nginx-debian.html;

        server_name _;

        location / {
            try_files \$uri \$uri/ =404;
        }

        add_header X-Served-By \$hostname;
    }',
    notify => Service['nginx'],
  }

  service { 'nginx':
    ensure => running,
    enable => true,
  }
}

include custom_header" | sudo tee /etc/puppet/manifests/site.pp

sudo apt-get update
sudo apt-get install -y puppet

sudo puppet apply --verbose /etc/puppet/manifests/site.pp
