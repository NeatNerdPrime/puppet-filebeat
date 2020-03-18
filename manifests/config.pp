# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include filebeat::config
class filebeat::config {
  assert_private()

  file { '/etc/filebeat/configs':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0700',
  }

  file { '/etc/filebeat/filebeat.yml':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => epp(
        'filebeat/filebeat.yaml.epp',
        {
          'brokers' => $brokers,
        }
    ),
  }
}
