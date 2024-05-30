# Puppet manifest to install Flask version 2.1.0 and Werkzeug version 2.0.3 using pip3

package { 'python3-pip':
  ensure => installed,
}

exec { 'install_flask_and_werkzeug':
  command => '/usr/bin/pip3 install flask==2.1.0 werkzeug==2.0.3',
  unless  => '/usr/bin/pip3 show flask | grep -q "Version: 2.1.0" && /usr/bin/pip3 show werkzeug | grep -q "Version: 2.0.3"',
  require => Package['python3-pip'],
}
