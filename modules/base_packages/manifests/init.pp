class base_packages {

  $packages = [ 'build-essential', 'libssl-dev', 'libyaml-dev', 'libreadline-dev', 'openssl', 'curl', 'git', 'zlib1g-dev', 'bison', 'libxml2-dev', 'libxslt1-dev', 'libcurl4-openssl-dev', 'nodejs', 'libsqlite3-dev', 'sqlite3', 'libjs-jquery', 'libpq-dev' ]

  package { $packages: 
    ensure          => 'installed',
    install_options => ['--allow-unauthenticated', '--force-yes'],
  }

  package { 'bundler':
    ensure   => 'installed',
    provider => 'gem',
  }
}
