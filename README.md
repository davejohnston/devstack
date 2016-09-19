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

You can log into the VM by using the vagrant ssh command
```bash
vagrant ssh
```

N.B in order to access Openstack instances via floating IPs you must setup a route on the host system. e.g Where the floating IP range is 172.24.4.0/24 and the IP of the VM is 172.28.128.3 you would add the following route


```bash
 route add 172.24.4.0 MASK 255.255.255.0 172.28.128.3
```


