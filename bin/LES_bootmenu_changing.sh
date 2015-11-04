#!/bin/sh

the script would need to make a single boot screen on startup; currently in the RC2 and cooking versions there are 3; one where you select language, then a screen where you can type extra parameters in (disappears quickly) and then another screen to select whether one wishes to start the justx, core, or another flavor, or a memtest, ... Only the last screen should be kept and preferably made to show:
* log in as root
* log in as root + persistence
* log in as user (tux)
* log in as user (tux) + persistence
* install SliTaz to HD
* help and options
* Command line
* PXE boot

Note that, obviously, the login accounts with persistence will only be of use with writable media (so not when booting from livecd (cd-r))
That said, if the user wants to only use it with non-writable media, he can easily remove these login accounts and make an updated new Slitaz LiveCD. The same goes when the user has installed slitaz to HD and wants to remove the "install to hard disk function". 

Xforcevesa might be used for initial install and livecd, but it isn't standardly shown as a boot option (using it as the main driver for inside slitaz after logging in). I still found that when using a not supported graphics card, slitaz defaults to the tty1 login screen and only text mode is available (no x). There should be the option to still login, get the drivers installed and working and then reboot and run without safe graphics option (xvesa) at the boot screen.

the script should also add the regular slitaz graphics drivers, and these additional graphics drivers:
Additional packages to avoid graphics problems; note that these were standard in slitaz 4 final yet there are not standardly present in slitaz5 RC2:
* xorg-xf86-video-intel
* xorg-libXvMC
* xorg-libXv
* mesa-dri-intel
* mesa
* mesa-dri-ati
