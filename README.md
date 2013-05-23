# How we build .box files for MetaCPAN developers

## You are now looking behind the curtain!

This repo builds the .box file which is then used by MetaCPAN developers via
[metacpan-developer](https://github.com/CPAN-API/metacpan-developer), as a
standardized development environment that (once the .box file is downloaded) is
quick to deploy and start working on.

[metacpan-developer](https://github.com/CPAN-API/metacpan-developer) is where
you should go if you are looking to use the virtual machine we build to help
out on the MetaCPAN project itself.

## To build our .box files...

-  Check out this repo

        git clone git://github.com/CPAN-API/metacpan-vagrant.git

-  Setup repositories (as per
   [metacpan-developer](https://github.com/CPAN-API/metacpan-developer))

    Make a 'metacpan' directory at the same level and check out the
    repositories which will be shared into the virtual machine, below we are
    cloning the official repositories as read only - you could of course either
    fork any of these, or just add your own fork as a remote to push to.

        mkdir metacpan
        cd metacpan
        git clone git://github.com/CPAN-API/metacpan-puppet.git
        git clone git://github.com/CPAN-API/cpan-api.git
        git clone git://github.com/CPAN-API/metacpan-web.git
        git clone git://github.com/CPAN-API/metacpan-explorer.git

- Install [Vagrant](http://downloads.vagrantup.com/) (ideally 1.2.2) and
  [VirtualBox](https://www.virtualbox.org/wiki/Downloads) (ideally 4.2.12)

### Each of these vm's builds on the previous VM, see README's in each dir

- vm_debian: [instructions](vm_debian/README.md)

    Building a debian (wheezy, 32bit) .box to have [on
    http://vmbox.metacpan.org](http://vmbox.metacpan.org/)

- vm_base [instructions](vm_base/README.md)

    Goal: Built on top of vm_debian - has had puppet run and the cpan modules
    installed, it ready to be used by the
    [metacpan-developer](https://github.com/CPAN-API/metacpan-developer)
    project
