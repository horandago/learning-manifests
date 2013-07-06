# build-env.pp

# Create a build environment, optionally adding packages
# depending on whether or not the OS is debian-based

case $operatingsystem {
  centos, redhat: { $build_env = ["gcc"] }
  debian, ubuntu: { $build_env = ["gcc", "build-essential"] }
  default: { fail("Unrecognized operating system for our desired build environment.") }
}

package { $build_env:
  ensure => installed,
}
