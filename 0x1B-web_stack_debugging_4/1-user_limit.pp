#Change the OS configuration so that it is possible to login with the holberton user and open a file without any error message.

# Increase hard file limit for holbrton user

exec { 'increase-hard-file-limit-for-holbrton-user':
  command => 'sed -i "/^holberton hard/s/4/50000/" /etc/security/limits.conf',
  path    => '/usr/local/bin/:/bin/',
}

# Increase soft file limit for holbrton user

exec { 'increase-soft-file-limit-for-holbrton-user':
  command => 'sed -i "/^holberton soft/s/5/50000/" /etc/security/limits.conf',
  path    => '/usr/local/bin/:/bin/',
}
