class base_packages {

  $packages = [ 'build-essential', 'libssl-dev', 'libyaml-dev', 'libreadline-dev', 'openssl', 'curl', 'git', 'zlib1g-dev', 'bison', 'libxml2-dev', 'libxslt1-dev', 'libcurl4-openssl-dev', 'nodejs', 'libsqlite3-dev', 'sqlite3', 'libjs-jquery', 'libpq-dev' ]

  package { $packages: 
    ensure          => 'installed',
    install_options => ['--allow-unauthenticated', '--force-yes'],
  }


 file { '/root/ruby_2.3.1.sh':
  ensure  => present,
  source  => 'puppet:///modules/base_packages/ruby_2.3.1.sh',
  owner   => 'root',
  group   => 'root',
  mode    => '0744',
  require => Package[$packages]
  }->
  exec {"execute_ruby":
    user    => 'root',
    command => '/root/ruby_2.3.1.sh > /root/log_ruby',
    unless  => '/bin/ls /root/ruby-2.3.1_deployed'
  }->
  package { 'bundler':
    ensure   => 'installed',
    provider => 'gem',
  }
}
