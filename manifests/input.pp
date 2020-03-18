# @summary A short summary of the purpose of this defined type.
#
# A description of what this defined type does
#
# @example
#   filebeat::input { 'namevar': }
define filebeat::input (
  String[1]                                                  $topic,
  Variant[Stdlib::Absolutepath, Array[Stdlib::Absolutepath]] $paths,
  Enum['present', 'absent']                                  $ensure = 'present',
  Array[String]                                              $exclude_files = [],
  Hash                                                       $fields        = {},
){
  include ::filebeat

  $file_ensure = $ensure ? {
    'present' => 'file',
    'absent'  => 'absent',
  }

  file { "filebeat input ${title}":
    ensure                  => $file_ensure,
    path                    => "/etc/filebeat/configs/${name}.yml",
    owner                   => 'root',
    group                   => 'root',
    mode                    => '0600',
    selinux_ignore_defaults => true,
    content                 => epp(
      'filebeat/filebeat_vhost.yml.epp',
      {
        'paths'         => flatten([$paths]),
        'exclude_files' => $exclude_files,
        'topic'         => $topic,
        'fields'        => $fields,
      }
    ),
    notify                  => Class['filebeat::service'],
  }
}
