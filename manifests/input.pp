# @summary A short summary of the purpose of this defined type.
#
# A description of what this defined type does
#
# @example
#   filebeat::input { 'namevar': }
define filebeat::input (
  String[1]                                                  $topic,
  Variant[Stdlib::Absolutepath, Array[Stdlib::Absolutepath]] $paths,
  Array[String]                                              $exclude_files = [],
  Hash                                                       $fields        = {},
){
  include ::filebeat

  file { "filebeat input ${title}":
    path                    => "/etc/filebeat/configs/${name}.yml",
    ensure                  => file,
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
