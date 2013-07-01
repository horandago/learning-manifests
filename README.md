learning-manifests
==================

Repo to store "Learning Puppet VM" exercises (presuming I can get the VM networking to fetch/push). 

The Learing VM appears to need root certs that are needed to work with "git clone" commands out of the box. Work around that by exporting:

GIT_SSL_NO_VERIFY=true
