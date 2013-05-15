# How to build a wheezy box...

We build our own [mcwheezy box](http://mcvbox.s3-website-us-east-1.amazonaws.com/mcwheezy.box).

## Notes on manual build of Wheezy

		configure new VirtualBox machine all defaults except:
		- System -> motherboard -> disable floopy boot
		- 40 GB VMDK hard disk - auto expand on SATA controller
		- CD on SATA controller
		- disable audio

### Installing

Following [these instructions](http://blog.codeboutique.com/post/creating-debian-squeeze-box-for-vagrant) but use wheezy basically.

Root password: vagrant

Use the vagrant public key option
