# Creating and managing virtual development machines for Metacpan

### Idea:

-  Check out this repo

		git clone git://github.com/CPAN-API/metacpan-vagrant.git

-  Setup submodules (e.g. our base code), these are cloned from https://github.com/CPAN-API/ as read only, so you will need to add a  writable remote repository if you want to push changes somewhere (more on that later)

		git submodule init
		git submodule update

	You get 3 repos: 
	- puppet (sysadmin/server setup)
	- api (backend)
	- web (front end)

- Install [Vagrant](http://downloads.vagrantup.com/)

- Choose the type of development machine you need:
	- vm_base (minimal install with puppet having been run)
	- vm_minicpan (base + minicpan having been run and loaded into ElasticSearch)

			cd [machine_type]

- Start the virtual machine

		vagrant up

- Connect

		vagrant ssh
		sudo su -     (to become root)

- To edit

	Make changes in the submodules repos these are mounted as

	- puppet /etc/puppet
	- web /home/metacpan/metacpan.org
	- api /home/metacpan/api.metacpan.org

	You can then restart the relevant services or run puppet as needed from within the virtual machine


### Uploading your code changes

