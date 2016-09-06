class bashrc (
  $vagrant_bashrc_path
) {
  file { 'vagrant-bashrc':
    path   => '/home/vagrant/.bashrc',
    ensure => file,
    source => "puppet://$vagrant_bashrc_path",
    owner  => 'vagrant',
    group  => 'vagrant',
    mode   => 0644,
  }
}
