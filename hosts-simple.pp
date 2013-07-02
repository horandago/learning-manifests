# hosts-simple.pp

# Host type reference:
# http://docs.puppetlabs.com/references/stable/type.html#host

host {'self':
  ensure      => present,
  name        => $fqdn,
  host_aliases  => ['puppet', $hostname],
  ip          => $ipaddress,
}

file {'motd':
  ensure      => file,
  path        => '/etc/motd',
  mode        => 0644,
  content     => "Welcome to ${hostname},\na ${operatingsystem} island in the sea of ${domain}.\n",
}
