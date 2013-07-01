file {'motd':
    path    => '/etc/motd',
    ensure  => present,
    mode    => 0640,
    content => "Welcome to my puppet manifest-driven MOTD! You are awesome!\n",
}
