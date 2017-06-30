#
class forecast::package {

  package { 'dashing':
    ensure   => 'installed',
    provider => 'gem',
  } ->
    exec {'create_forecast':
      user    => 'blog',
      cwd     => '/home/blog/sinatra-skeleton',
      command => '/usr/local/bin/dashing new forecast',
      path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:',
      unless  => '/bin/ls /home/blog/sinatra-skeleton/forecast',
  }
}
