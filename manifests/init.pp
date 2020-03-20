# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include filebeat
class filebeat (
  Array[String] $brokers,
  Hash          $inputs = {},
  Boolean       $manage_package      = true,
  Boolean       $manage_service      = true,
  Boolean       $manage_repositories = true,
  String        $service_name        = 'filebeat',
  String        $package_version     = '7.3.1',
) {


  class { 'filebeat::repositories': }
  -> class { 'filebeat::install': }
  -> class { 'filebeat::config': }
  ~> class { 'filebeat::service': }

  contain(
    filebeat::repositories,
    filebeat::install,
    filebeat::config,
    filebeat::service,
  )

  create_resources(
    'filebeat::input',
    $inputs,
    {
      service_name => $service_name,
    },
  )
}
