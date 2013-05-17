# How to build a wheezy box...

We build our own [mcwheezy box](http://vmbox.metacpan.org/mcwheezy.box).
using [debian-7.0.0-i386-netinst.iso](http://cdimage.debian.org/debian-cd/7.0.0/i386/iso-cd/debian-7.0.0-i386-netinst.iso).

## Notes on manual build of Wheezy - we should build 32, NOT 64, makes it easier for contributors

		configure new VirtualBox machine all default debian options except:
		- System -> motherboard -> disable floopy boot
		- 40 GB VMDK hard disk - auto expand on SATA controller
		- CD on SATA controller
		- disable audio

### Installing

Following [these instructions](http://blog.codeboutique.com/post/creating-debian-squeeze-box-for-vagrant) but use wheezy basically.

Set root password to: vagrant

Use the vagrant public key option (makes it easier for our users)
