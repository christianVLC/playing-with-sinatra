#
class sinatra::service {

  service { 'thin':
    ensure => running,
    enable => true
  }
}
