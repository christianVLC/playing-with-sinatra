#
class profile::world_temperatures::init {
  class { '::base_packages': }->
  class { '::sinatra': } ->
  class { '::forecast': }
}
