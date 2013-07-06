# case-apache.pp

# Pick the right kind of package to install based on the OS.
# Ensure that we have the most current version.


case $operatingsystem {
  centos, redhat: { $apache = "httpd" }
  debian, ubuntu: { $apache = "apache2" }
  default: { fail("Unrecognized operating system for webserver") }
}

package { $apache:
  ensure => latest,
}
