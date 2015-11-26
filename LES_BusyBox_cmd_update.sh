##########################################################################
#                         BusyBox_cmd_update                             #
# made by Brian Peregrine, released under the GNU General Public License #
##########################################################################

#This script will
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

#!/bin/sh

tazpkg remove busybox

cd ~/files_busybox_cmd_update/
tazpkg install busybox-1-24-1-altered.tazpkg

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
