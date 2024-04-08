# custom_header.pp

# Install Nginx package
package { 'nginx':
  ensure => installed,
}

# Define custom HTTP header value
$hostname = $::hostname

# Configure Nginx to add custom header
nginx::resource::vhost { 'default':
  ensure   => present,
  www_root => '/var/www/html',
  proxy    => 'http://localhost:8080', # Assuming your backend application is running on localhost:8080
  header   => {
    'X-Served-By' => $hostname,
  },
}

