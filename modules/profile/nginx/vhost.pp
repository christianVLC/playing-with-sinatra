#
class profile::nginx::vhost {

  $defaults  = hiera_hash('profile::nginx::vhost::defaults', {})
  $resources = hiera_hash('profile::nginx::vhost::resources', {})

  assert_type(Hash, $defaults)
  assert_type(Hash, $resources)

  create_resources('nginx::resource::vhost', $resources, $defaults)

}
