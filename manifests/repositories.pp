# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include filebeat::repositories
class filebeat::repositories {
  assert_private()

  if $filebeat::manage_repositories {
    yumrepo { 'elastic-7.x':
      ensure   => present,
      descr    => 'name=Elastic repository for 7.x packages',
      baseurl  => 'https://artifacts.elastic.co/packages/7.x/yum',
      gpgcheck => 1,
      gpgkey   => 'https://artifacts.elastic.co/GPG-KEY-elasticsearch',
      enabled  => 1,
    }
  }
}
