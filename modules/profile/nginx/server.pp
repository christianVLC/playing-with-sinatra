# ============================
class profile::nginx::server {

  # https://github.com/jfryman/puppet-nginx/blob/master/docs/hiera.md
  Anchor['nginx::begin'] -> Class['nginx::config']

  class { '::nginx::config':
    worker_processes => hiera('nginx::config::worker_processes', $::facts['processors']['count']),
    server_tokens    => hiera('nginx::config::server_tokens', 'off'),
  }

  class { '::nginx': }

}
