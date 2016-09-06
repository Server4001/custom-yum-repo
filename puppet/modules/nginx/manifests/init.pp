class nginx {
  contain 'nginx::install', 'nginx::configure', 'nginx::service'
}
