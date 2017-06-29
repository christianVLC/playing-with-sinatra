
class profile::temperatures_packages::init {

  #$resources = hiera_hash('profile::ruby::init::resources', {})
  #assert_type(Hash, $resources)
  #  class { '::ruby':
    #    version => '2.3.1',
    #  version => '2.0',
    #    version => 'lastest',
    # }
  class { '::base_packages': }

}
