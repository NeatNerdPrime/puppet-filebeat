# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include filebeat::service
class filebeat::service {
  assert_private()

  if $filebeat::manage_service {
    service { 'filebeat':
      ensure    => running,
      enable    => true,
    }
  }
}
