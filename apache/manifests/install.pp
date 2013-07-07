

class apache::install {
  case $operatingsystem {
    centos, redhat: { $apache = "httpd" }
    debian, ubuntu: { $apache = "apache2" }
    default: { fail("Unrecognized operating system for webserver") }
  }

  package { $apache:
    ensure => latest,
  }

}
