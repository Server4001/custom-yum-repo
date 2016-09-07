class common_packages {
  package { ['man', 'man-pages', 'vim-enhanced', 'git', 'tree', 'screen']:
    ensure => 'installed',
  }
}
