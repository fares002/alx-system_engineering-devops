# Ensure the holberton user exists
user { 'holberton':
  ensure => 'present',
}

# Increase hard file limit for holberton user
exec { 'increase-hard-file-limit-for-holberton-user':
  command => 'sed -i "/^holberton.*hard.*nofile/s/5/50000/" /etc/security/limits.conf',
  path    => ['/usr/local/bin', '/bin', '/usr/bin', '/sbin'],
  unless  => 'grep -q "holberton.*hard.*nofile.*50000" /etc/security/limits.conf',
  require => User['holberton'],
}

# Increase soft file limit for holberton user
exec { 'increase-soft-file-limit-for-holberton-user':
  command => 'sed -i "/^holberton.*soft.*nofile/s/4/50000/" /etc/security/limits.conf',
  path    => ['/usr/local/bin', '/bin', '/usr/bin', '/sbin'],
  unless  => 'grep -q "holberton.*soft.*nofile.*50000" /etc/security/limits.conf',
  require => User['holberton'],
}

