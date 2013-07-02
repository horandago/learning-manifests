# This would be an interesting manifest. Yet the Learning Puppet VM doc
# neglects to let you know beforehand that you would need to set up
# networking between the guest and host machines for you to *actually*
# test this out in real life.

ssh_authorized_key {'learning_puppet':
  ensure=> present,
  type => 'ssh-rsa',
  user => 'root',
  key => 'AAAAB3NzaC1yc2EAAAABIwAAAQEAvcTzOdKjdmpuqI2p2bx8o24q+EsMOececFt4Q2pn1hHxDOfP7DmehbAoABrwPXr4/ZBuWwqrgzqou4nl5OZuQRcCyiSNpwHvkhE8rvq7bgHXiwezb/OJwHUqYk9bOW8wX3knvCYQPKActS/xO5RbQGZps41zWFWQXNc5sc4Rz//jK8/+1hDEnriMmohQX5wxiR2LRieqdsnABueigqAM/DXb5diWsMBbLV+cotzaNcMpWOjl4up6A8xhvOQrXIHZpi9Rl7dv0voG0T+0sFHzRoG8YWSgArFtGI+6OC0EQ5TMqlJVVZ9clpkhtNzY8pmCG7QuMWt+/Zw622va2cvdSQ==root@learn.localdomain',
}
