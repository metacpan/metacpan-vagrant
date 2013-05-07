# How to build our vm_base box

This box has puppet run to configure most stuff, then we get the Perl modules installed as well, do some cleanup and then box it. 

We create the machine from our basic Debian Wheezy box, so from this directory

	vagrant up
	vagrant ssh
	sudo su -

Install all the packages / configs etc

	/etc/puppet/run.sh

Now download the repos and install all the perlmodules

	/home/metacpan/bin/update_repos

Remove the repos as the users will mount the repos

	rm /home/metacpan/metacpan.org
	rm /home/metacpan/api.metacpan.org

