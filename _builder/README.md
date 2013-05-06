# How we build .box files for metacpan developers

## You are now looking behind the curtain!

- We use the same 'metacpan' directory with the 3 repos checked out, as [from here](../README.md)

Each of these vm's builds on the previous VM

- vm_debian

	At the moment we are using a debian wheezy .box 
	which we created and have a copy of [on S3](http://mcvbox.s3-website-us-east-1.amazonaws.com/)

- vm_base

	Goal: A new debian box that has had puppet run and the cpan modules installed

		cd _builder/vm_base
