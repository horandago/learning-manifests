
if $is_virtual == 'true' {
  service {'ntpd':
#    ensure => stopped,
    ensure => running,    
    enable => false,
  }
}
else {
  service{'ntpd':
    name => 'ntpd',
    ensure => running,
    enable => true,
    hasrestart => true,
    require => Package['ntp'],
  }
}
