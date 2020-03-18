# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include filebeat::install
class filebeat::install {
  assert_private()

  if $filebeat::manage_package {
    package { 'filebeat':
      ensure => $filebeat_version,
    }
  }
}
