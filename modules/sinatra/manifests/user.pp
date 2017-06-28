class sinatra::user {
  group { 'blog':
    ensure  => 'present',
  }
  user { 'blog':
    ensure     => present,
    groups     => ['blog'],
    home       => '/home/blog',
    shell      => '/usr/sbin/nologin',
    managehome => true,
    comment    => 'user_for_sinatra',
  }
}
