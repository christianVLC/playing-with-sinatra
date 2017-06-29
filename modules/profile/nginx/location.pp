#
class profile::nginx::location {

  $defaults  = hiera_hash('profile::nginx::location::defaults', {})
  $resources = hiera_hash('profile::nginx::location::resources', {})

  assert_type(Hash, $defaults)
  assert_type(Hash, $resources)

  create_resources('nginx::resource::location', $resources, $defaults)

}
