#!/bin/bash

echo "ARGS [$@]" >> /tmp/running.txt

sudo dnf install --best -y  git libnghttp2 libnghttp2-devel mod_wsgi facter
cd ~
git clone https://git.openstack.org/openstack-dev/devstack

cat << EOF > ~/devstack/local.conf
[[local|localrc]]
ADMIN_PASSWORD=secret
DATABASE_PASSWORD=\$ADMIN_PASSWORD
RABBIT_PASSWORD=\$ADMIN_PASSWORD
SERVICE_PASSWORD=\$ADMIN_PASSWORD

# Replace MySQL with Postgres
disable_service mysql
enable_service postgresql

PUBLIC_INTERFACE=eth1
EOF
echo "HOST_IP=$(facter ipaddress_eth1)" >> ~/devstack/local.conf

sudo dd if=/dev/zero of=/swapfile bs=1024 count=4194304
sudo mkswap /swapfile
sudo sed -i '$s/$/\n\/swapfile          swap            swap    defaults        0 0/' /etc/fstab
sudo swapon -a

cd ~/devstack && ./stack.sh
