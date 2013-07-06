

package{'ntp':
  ensure => installed,
}


case $operatingsystem {
  centos, redhat: {
    $ntp_source = "/tmp/rhel-ntp.conf"
    $ntp_service = "ntpd"
  }
  debian, ubuntu: {
    $ntp_source = "/tmp/deb-ntp.conf"
    $ntp_service = "ntp"
  }
  default: { fail("Unrecognized operating system for ntp configuration") }
}


file{'/etc/ntp.conf':
  ensure => present,
  source => $ntp_source,
}

service {$ntp_service:
  ensure => running,
  enable => true,
}
