#!/bin/bash

echo "vagrant provision: $0"

# pizza pizza
dir=/vagrant/Vagrant

# run.sh (in metacpan-puppet) won't run until this is done:
hosts_line="127.0.0.1    puppet"
grep -F "$hosts_line" /etc/hosts || echo $'\n\n# puppet (run.sh)\n'"$hosts_line" >> /etc/hosts

# We need Vagrant to establish the mount point through virtualbox (for -t vboxsf)
# but we need to remount it manually to chown it to root.
# Unmount it here to avoid any side effects of running init.sh
umount /etc/puppet

apt-get update

apt-get -q --assume-yes install vim sudo openssh-server git
apt-get -q --assume-yes install puppetmaster puppet

# We don't want puppet running automatically
update-rc.d puppetmaster disable; /etc/init.d/puppetmaster stop
update-rc.d puppet disable; /etc/init.d/puppet stop
update-rc.d puppetqd disable; /etc/init.d/puppetqd stop

cd /etc
# Clean out package files
rm -rf /etc/puppet
mkdir -p /etc/puppet/files

# now remount stuff
ssldir=/etc/puppet/ssl

for mnt in $ssldir v-puppet; do
  mount | grep -qE "(^| )${mnt} " && umount "$mnt"
done

# just umount, don't remount
if [ "$1" = "-u" ]; then
  exit
fi

# show a reminder if the shared folder is ever not mounted
echo "Vagrant should mount the repo root over this directory" > /etc/puppet/VAGRANT_SHARE_DIR_NOT_MOUNTED.txt

# Now remount it with root as the owner so puppet works correctly
mount -t vboxsf -o uid=0,gid=0 /etc/puppet /etc/puppet/

# Mount another fs on top of the share so we can change the owner
# since the 'puppet' user needs to be able to write to the ssl dir
# (but we can't change the owner on a subdir of the vboxsf).
# This way we can keep the same config as production (no vagrant).

mkdir -p $ssldir

ssl_bind_src=/etc/puppet-ssl
mkdir -p $ssl_bind_src
chown puppet:puppet $ssl_bind_src

mount --bind $ssl_bind_src $ssldir

chown -R puppet:puppet $ssldir

echo 'Now follow the rest of the steps from:'
echo 'https://github.com/CPAN-API/metacpan-puppet/blob/master/documentation/INSTALL_FINALIZING.md'

