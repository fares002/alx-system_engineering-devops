# Increases the amount of traffic nginx server can handle

# increase the ULIMT of the default file

exec { 'fix--fir-nginx-':
  # Modify the ULIMIT value
  command => '/bin/sed -i "s/15/4096/" /etc/default/nginx',
  # sprcify the path for the sed command
  path    => '/usr/local/bin/:/bin/',
}

exec { 'nginx-restart':
  command => '/etc/init.d/nginx restart',
  path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  onlyif  => 'pgrep nginx',  # Optional: ensures Nginx is running before trying to restart
}

