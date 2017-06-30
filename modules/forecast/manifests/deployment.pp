#
class forecast::deployment {

 file { '/home/blog/sinatra-skeleton/forecast/jobs/forecast.rb':
  ensure  => present,
  source  => 'puppet:///modules/forecast/forecast.rb',
  owner   => 'blog',
  group   => 'blog',
  mode    => '0755',
  require => Class['forecast::package']
  }->
  file { '/home/blog/sinatra-skeleton/forecast/widgets/forecast':
    ensure => directory,
    owner  => 'blog',
    group  => 'blog',
    mode   => '0755'
  } ->
  file { '/home/blog/sinatra-skeleton/forecast/widgets/forecast/forecast.coffee':
    ensure  => present,
    source  => 'puppet:///modules/forecast/forecast.coffee',
    owner   => 'blog',
    group   => 'blog',
    mode    => '0755',
  } ->
  file { '/home/blog/sinatra-skeleton/forecast/widgets/forecast/forecast.html':
    ensure  => present,
    source  => 'puppet:///modules/forecast/forecast.html',
    owner   => 'blog',
    group   => 'blog',
    mode    => '0755',
  } ->
  file { '/home/blog/sinatra-skeleton/forecast/widgets/forecast/forecast.scss':
    ensure  => present,
    source  => 'puppet:///modules/forecast/forecast.scss',
    owner   => 'blog',
    group   => 'blog',
    mode    => '0755',
  }->
  file { '/home/blog/sinatra-skeleton/forecast/dashboards/sample.erb':
    ensure  => present,
    source  => 'puppet:///modules/forecast/sample.erb',
    owner   => 'blog',
    group   => 'blog',
    mode    => '0755',
  }


}
