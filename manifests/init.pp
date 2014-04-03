class smbd ($config) {
  package { 'samba': ensure => present }

  service { 'smbd':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => Package['samba']
  }

  file { '/etc/samba/smb.conf':
    ensure  => file,
    source  => $config,
    owner   => 'root',
    group   => 'root',
    mode    => '644',
    require => Package['samba'],
    notify  => Service['smbd']
  }
}
