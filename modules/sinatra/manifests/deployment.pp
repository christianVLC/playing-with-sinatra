#
class sinatra::deployment {

 file { '/home/blog/sinatra-skeleton-deployment.sh':
  ensure  => present,
  source  => 'puppet:///modules/sinatra/sinatra-skeleton-deployment.sh',
  owner   => 'blog',
  group   => 'blog',
  mode    => '0755',
  require => Class['sinatra::user','base_packages']
  }->
  exec {"execute sinatra-skeleton-deployment.sh":
    user    => 'root',
    command => "/usr/bin/sudo -u blog bash -lc '/home/blog/sinatra-skeleton-deployment.sh > /tmp/log_sinatra'",
    unless  => '/bin/ls /home/blog/sinatra-skeleton',
  }

  file { '/etc/thin':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0644'
  }
  file { '/etc/init.d/thin':
    ensure => present,
    source => 'puppet:///modules/sinatra/thin',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }->
  file { '/etc/thin/blog.yml':
    ensure  => present,
    source  => 'puppet:///modules/sinatra/blog.yml',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => File['/etc/init.d/thin']
  }->
  exec { 'thin_service':
    command     => 'update-rc.d -f thin defaults',
    cwd         => '/tmp',
    path        => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:',
    refreshonly => true
  }
}
