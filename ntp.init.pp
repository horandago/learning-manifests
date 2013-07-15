# = Class: ntp
#
# This class installs/configures/manages NTP. It can disable NTP on VMs.
# RH and Debian are the only supported OSes.
# 
# == Parameters:
#
# $servers:: An array of NTP servers, with/without +iburst+ and
#            +dynamic+ statements
# $enable:: Whether to start NTP service on boot or not. Defaults to true.
#           Valid vaules: true and false.
# $ensure:: Whether to run the NTP service. Defaults to running. Valid values
#           running and stopped
#
# == Requires:
#
# Nothing.
#
# == Sample Usage:
#
# class {'ntp':
#   servers => ["ntp1.example.com dynamic",
#               "ntp2.example.com dynamic",],
# }
# class {'ntp':
#   enable => false,
#   ensure => stopped,
#}


class ntp ($servers = undef, $enable = true, $ensure = running) { 
  case $operatingsystem {
    centos, redhat: {
      $service_name = 'ntpd'
      $conf_file    = 'ntp.conf.el'
      $default_servers = [ "0.centos.pool.ntp.org",
                           "1.centos.pool.ntp.org",
                           "2.centos.pool.ntp.org",]
    }


    debian, ubuntu: {
      $service_name = 'ntp'
      $conf_file    = 'ntp.conf.debian'
      $default_servers = [ "0.debian.pool.ntp.org iburst",
                           "1.debian.pool.ntp.org iburst",
                           "2.debian.pool.ntp.org iburst",]
    }
  }

# We paramaterize the instantiation of the class. If we
# invoke the class with 'class {'ntp': servers => ["ntp1.foo", "ntp2.foo",], }
# it will override the default users within the ntp.conf file.

if $servers == undef {  
  $servers_real = $default_servers
}
else {
  $servers_real = $servers
}
  
  package { 'ntp':
    ensure => installed,
  }

  service { 'ntp':
    name      => $service_name,
    ensure    => running,
    enable    => true,
    subscribe => File['ntp.conf'],
  }
  
  file { 'ntp.conf':
    path    => '/etc/ntp.conf',
    ensure  => file,
    require => Package['ntp'],
    content => template("ntp/${conf_file}.erb"),
  }  

}
