class yum_utils {
  package { 'yum-utils':
    ensure => 'latest',
  }->

  package { 'createrepo':
    ensure => 'latest',
  }
}
