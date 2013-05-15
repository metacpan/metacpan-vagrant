# How we build .box files for metacpan developers

## You are now looking behind the curtain!

This repo builds the .box file which is then used by metcpan
developers via [metacpan-developer](https://github.com/CPAN-API/metacpan-developer),
as a standardized development environment that (once the .box file is downloaded)
is quick to deploy and start working on.

[metacpan-developer](https://github.com/CPAN-API/metacpan-developer) is where you should go if you are looking to use the virtal machine we build to help out on the metacpan project itself.

## To build our .box files...

-  Check out this repo

		git clone git://github.com/CPAN-API/metacpan-vagrant.git

-  Setup repositories (as per [metacpan-developer](https://github.com/CPAN-API/metacpan-developer))

	Make a 'metacpan' directory at the same level and check out the repositories
	which will be shared into the virtual machine, below we are cloning
	the official repositories as read only - you could of course either
	fork any of these, or just add your own fork as a remote to push to.

		mkdir metacpan
		cd metacpan
		git clone git://github.com/CPAN-API/metacpan-puppet.git
		git clone git://github.com/CPAN-API/cpan-api.git
		git clone git://github.com/CPAN-API/metacpan-web.git

- Install [Vagrant](http://downloads.vagrantup.com/) (ideally 1.2.2) and [VirtualBox](https://www.virtualbox.org/wiki/Downloads) (ideally 4.2.12)

### Each of these vm's builds on the previous VM, see README's in each dir

- vm_debian

	At the moment we are using a debian wheezy .box 
	which we created and have a copy of [on S3](http://mcvbox.s3-website-us-east-1.amazonaws.com/)

- vm_base

	Goal: A new debian box that has had puppet run and the cpan modules installed
