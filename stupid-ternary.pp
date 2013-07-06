# Avoid selectors at all costs.
$apache = $operatingsystem ? {
  centos => 'httpd',
  redhat => 'httpd',
  # Don't actually use this package name, even though is mentioned
  # in the documentation.
  /(?i)(ubuntu|debian)/ => "apache2-$1",
  default => undef,
}
