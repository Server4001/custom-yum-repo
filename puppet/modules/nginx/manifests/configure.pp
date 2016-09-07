class nginx::configure {
  file { 'www_folder':
    path   => '/var/www',
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => 0755,
  }

  file { 'html_folder':
    path    => '/var/www/html',
    ensure  => 'directory',
    owner   => 'vagrant',
    group   => 'vagrant',
    mode    => 0755,
    require => File['www_folder'],
  }

  file { 'log_folder':
    path   => '/var/log/www',
    ensure => 'directory',
    owner  => 'vagrant',
    group  => 'vagrant',
    mode   => 0755,
  }

  file { 'fastcgi_params':
    path    => '/etc/nginx/fastcgi_params',
    source  => 'puppet:///modules/nginx/fastcgi_params',
    owner   => 'root',
    group   => 'root',
    mode    => 0644,
    notify  => Service['nginx'],
  }

  file { 'config_nginx':
    path    => '/etc/nginx/nginx.conf',
    source  => 'puppet:///modules/nginx/nginx.conf',
    owner   => 'root',
    group   => 'root',
    mode    => 0644,
    notify  => Service['nginx'],
  }

  file { 'admin_htpasswd':
    path    => '/etc/nginx/conf.d/admin.htpasswd',
    source  => 'puppet:///modules/nginx/admin.htpasswd',
    owner   => 'root',
    group   => 'root',
    mode    => 0644,
    require => Package['nginx'],
  }->

  file { 'config_default_host':
    path    => '/etc/nginx/conf.d/default.conf',
    content => template('nginx/default.conf.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => 0644,
    notify  => Service['nginx'],
  }
}
