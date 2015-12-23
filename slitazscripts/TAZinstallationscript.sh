##########################################################################
#               TAZ installation script for slitaz 5                     #
# made by Brian Peregrine, released under the GNU General Public License #
##########################################################################

#!/bin/sh

tazpkg remove beaver
tazpkg remove dropbear
tazpkg remove epdfview
tazpkg remove gcolor2
tazpkg remove mtpaint
tazpkg remove mhwaveedit
tazpkg remove tazwikiss
tazpkg remove xombrero

tazpkg get-install get-palemoon
tazpkg get-install get-flash-plugin
tazpkg get-install geany
tazpkg get-install gajim
tazpkg get-install clamav
tazpkg get-install gadmin-antivirus
tazpkg get-install sshguard
tazpkg get-install ipkungfu
tazpkg get-install mps-youtube
tazpkg get-install firejail-taz_style
tazpkg get-install pypar2
tazpkg get-install gajim-OTR
tazpkg get-install pcmanfm-noGVFS
tazpkg get-install get-palemoon-secimp
tazpkg get-install conky-crnbng_style
tazpkg get-install openbox-crnbng_style
tazpkg get-install lxpanel-taz_style
tazpkg get-install fstab-simple_mountpoints
tazpkg get-install xscreensaver-slideshow_style
tazpkg get-install isolinux-persistencebootupforlivedistro
tazpkg get-install busybox-altered

tazpkg get-install xorg-xf86-video-ati
tazpkg get-install xorg-xf86-video-cirrus
tazpkg get-install xorg-xf86-video-geode
tazpkg get-install xorg-xf86-video-i740
tazpkg get-install xorg-xf86-video-intel
tazpkg get-install xorg-xf86-video-mach64
tazpkg get-install xorg-xf86-video-neomagic
tazpkg get-install xorg-xf86-video-nouveau
tazpkg get-install xorg-xf86-video-nv
tazpkg get-install xorg-xf86-video-radeon
tazpkg get-install xorg-xf86-video-s3
tazpkg get-install xorg-xf86-video-s3virge
tazpkg get-install xorg-xf86-video-savage
tazpkg get-install xorg-xf86-video-sis
tazpkg get-install xorg-xf86-video-trident
tazpkg get-install xorg-xf86-video-tseng
tazpkg get-install xorg-xf86-video-f4l
tazpkg get-install xorg-xf86-video-vmware

tazpkg clean-cache

cd ~/home/tux
rm -r .mhwaveedit .xombrero

Busybox altered details:
busybox-altered will
#Remove tty
#Remove ttysize
#Remove getty
#Remove less, (keeping only vi)
#Remove rmdir (use rm -r command instead)
#Remove rpm
#Remove rpm2cpio
#Add locate command
#Add rename command
#Add ssh

for all this, busybox will need to be rebuild appearantly, can't be done with
deleting things from outside busybox, see 
http://busybox.net/FAQ.html#backporting

If you don't want to take the risk of replacing all applets by newer
versions, you can employ this trick:

Download most recent release, configure it with "make allnoconfig", then
use "make menuconfig" to switch on just the applet you want to test and
maybe a couple of tuning options. Then build Busybox.

Then, on target system, delete the old applet symlink that points to
your old Busybox, and replace it with the new Busybox binary, renamed to
applet's name. In other words, if you want to replace only, say, httpd,
then delete, say, /bin/httpd symlink (which points to your old Busybox),
then run "cp /path/to/new/busybox /bin/httpd". (For some applets such as
login, you'll also need to "chmod u+s" your new busybox binary.)

Now you can test the new applet and post a more useful email to the
mailing list, either "I see such and such bug even in latest release" or
"I see such and such bug in release X.Y.Z, but it seems to be fixed in
last release".

Deleting the old symlink still leaves the old functionality in your
existing old Busybox binary, you just wouldn't be using it anymore. If
things will get even worse with new version, you can always restore the
symlink.
