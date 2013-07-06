

package{'ntp':
  ensure => installed,
}


case $operatingsystem {
  centos, redhat: {
    $ntp_source = "/root/learning-manifests/ntp.conf.el"
    $ntp_service = "ntpd"
  }
  debian, ubuntu: {
    $ntp_source = "/root/learning-manifests/ntp.conf.debian"
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
