# How we build .box files for metacpan developers

## You are now looking behind the curtain!

- We use the same 'metacpan' directory with the 3 repos checked out, as [from here](../README.md)

- vm_base

	A new debian box that has _just_ had puppet run and the cpan modules installed

- vm_minicpan

	The base box, but with mirror of the active CPAN modules through CPAN::Mini

