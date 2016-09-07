class createrepo {
  exec { 'create yum repo':
    command => 'createrepo /var/www/html/packages',
    timeout => 60,
    path    => '/usr/bin:/usr/local/bin:/usr/sbin:/usr/local/sbin:/bin',
    creates => '/var/www/html/packages/repodata/',
    user    => 'vagrant',
    group   => 'vagrant',
    require => File['packages_folder'],
  }
}
