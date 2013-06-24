# How to build our vm_base box

This box has puppet run to configure most stuff, then we get the Perl modules installed as well, do some cleanup and then box it. 

We create the machine from our basic Debian Wheezy box, so from this directory

	cd vm_base (if you haven't already done so)
	vagrant up
	vagrant ssh
	sudo su -

Install all the packages / configs etc

	/etc/puppet/run.sh

Now download the repos and install all the perlmodules

	/home/metacpan/bin/update_repos

Remove the repos as the users will mount the repos

	rm -rf /home/metacpan/metacpan.org
	rm -r /home/metacpan/api.metacpan.org
	rm -rf /usr/share/doc
	find /var/cache -type f -exec rm -rf {} \;

	shutdown -h now

To compress (not tested)

- Open VirtualBox GUI
- Display -> Remote -> enable server
- Then launch and login as root

		init 1
		mount -o remount,ro /dev/sda1
		zerofree /dev/sda1

To package

- Open VirtualBox GUI
- Find the name of the box vm_base_.... 

		vagrant package --base vm_base_1368127757

- Rename with a version number

		mv package.box mc_base001.box

Now upload to S3 (remember to set world readable ACL) - then edit the Vagrantfile in metacpan-vagrant/vm_base

