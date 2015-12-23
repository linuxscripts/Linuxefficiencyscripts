#!/bin/sh

the script would need to make a single boot screen on startup; currently in the RC2 and cooking versions there are 3; one where you select language, then a screen where you can type extra parameters in (disappears quickly) and then another screen to select whether one wishes to start the justx, core, or another flavor, or a memtest, ... Only the last screen should be kept and preferably made to show:
* log in as root
* log in as root + persistence
* log in as user (anon)
* log in as user (anon) + persistence
* install SliTaz to HD
* help and options
* Command line
* PXE boot

Note that, obviously, the login accounts with persistence will only be of use with writable media (so not when booting from livecd (cd-r))
That said, if the user wants to only use it with non-writable media, he can easily remove these login accounts and make an updated new Slitaz LiveCD. The same goes when the user has installed slitaz to HD and wants to remove the "install to hard disk function". 
