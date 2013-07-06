case $ipaddress_eth0 {
  /^127[\d.]+$/: {
    notify {'misconfig':
      message => "Possible network misconfiguration: IP address of $0",
    }
  }
}
