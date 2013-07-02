file {'/tmp/test1':
  ensure  => file,
  content => "Hi.",
}

file {'/tmp/test2':
  ensure => directory,
  mode   => 0644,
}

file {'/tmp/test3':
  ensure  => link,
  target  => '/tmp/test1',
}

# This brings to mind idea of ensure that "no devs on prod systems"
user {'katie':
  ensure => absent,
}

notify {"I'm notifying you.":}
notify {"So am I!":}
