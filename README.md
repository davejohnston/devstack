# Devstack Vagrant Box

This is a simple vagrant box that provides a Devstack environment running on Fedora 23.

## Simple installation

Clone the repo, and start up Vagrant:

```bash
git clone https://github.com/StackStorm/st2vagrant.git
cd devstack
vagrant up
```

This command will download a vagrant  fedora23 box, create a virtual machine, and start a script to provision
the most recent stable version of devstack.

When the installation completes you can access horizon on the UI (see the console for the IP address).

N.B in order to access Openstack instances via floating IPs you must setup a route on the host system.
