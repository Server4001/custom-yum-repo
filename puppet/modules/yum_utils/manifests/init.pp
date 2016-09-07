class yum_utils {
  package { 'yum-utils':
    ensure => 'latest',
  }

  package { 'createrepo':
    ensure => 'latest',
  }

  package { 'httpd-tools':
    ensure => 'latest',
  }

  package { 'rpm-build':
    ensure => 'latest',
  }
}
