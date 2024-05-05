# Puppet manifest to reinstall Flask version 2.1.0 using pip3

package { 'python3-pip':
  ensure => installed,
}

exec { 'uninstall_flask':
  command => '/usr/bin/pip3 uninstall -y flask',
  onlyif  => '/usr/bin/pip3 show flask',
}

exec { 'install_flask':
  command => '/usr/bin/pip3 install flask==2.1.0',
  require => Package['python3-pip'],
}
