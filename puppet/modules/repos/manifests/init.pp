class repos {
  yumrepo { 'epel':
    ensure     => 'present',
    mirrorlist => 'https://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=$basearch',
    descr      => 'Extra Packages for Enterprise Linux 6 - $basearch',
    enabled    => 1,
    gpgcheck   => 0,
  }

  yumrepo { 'nginx':
    ensure   => 'present',
    baseurl  => 'http://nginx.org/packages/centos/6/$basearch/',
    descr    => 'nginx repo',
    enabled  => 1,
    gpgcheck => 0,
  }
}
