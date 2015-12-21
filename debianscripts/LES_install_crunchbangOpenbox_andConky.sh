##########################################################################
#                 install_crunchbangOpenbox_andConky                     #
# made by Brian Peregrine, released under the GNU General Public License #
##########################################################################

#This script will
#Install Conky
#Install vnStat
#Replace the conky configs with the configs previously found in the Crunchbang Linux distro with some additional changes
#Replace the openbox keybinds config files to those previously found in the Crunchbang Linux distro 
#Change the Openbox right-click menu
#Set up conky to start several conky sessions, for showing additional things like weather predictions, ...

#!/bin/sh

#Install Conky
dpkg -i conky_1.9.0-6_all.deb
dpkg -i conky-std_1.9.0-6_i386.deb

#Install vnStat (see http://www.tecmint.com/install-vnstat-and-vnstati-to-monitor-linux-network-traffic/)
cd ~/files_install_crunchbangOpenbox_and_conky_script/vnstat-1.14
make
make install
mkdir /var/lib/vnstat
vnstat --create -i eth0

#Replace the conky configs with the configs previously found in the Crunchbang Linux distro with some additional changes
cd ~/files_install_crunchbangOpenbox_and_conky_script/conky_config_files/
cp -f * /etc/conky/

#Replace the openbox keybinds config files to those previously found in the Crunchbang Linux distro with some additional keybinds
cd ~/files_install_crunchbangOpenbox_and_conky_script/Crunchbang_openbox_configs/
cp -f * /home/username/.config/openbox

#Set up conky to start several conky sessions, for showing additional things like weather predictions, ...
?

At the sourceforge site you'll find the crunchbang files located in Crunchbang at
file:///home/username/.config/openbox
file:////etc/conky

the conky changes include also displaying the IP adress, DNS adress and used bandwith (today) and used bandwith (this month), see http://forums.linuxmint.com/viewtopic.php?f=47&t=68240
http://crunchbang.org/forums/viewtopic.php?id=12224
and changing the shortcut keys list with the updates mentioned below

#Adding keybinds
#Add control+tab to allow switching between desktops (function as pager)
#Add control+alt+del to start LXTask
#Add control+f to start busybox's finder (which uses the locate backend)
#Add control+a to start LXappearance
#Add control+o to start obConf
#Remove, super+h, super+I shortcuts
#change super+m to start mpv, super+w to start palemoon, super+e to start leafpad
#change all this in conky too, to show the new shortcuts, and no longer show the removed ones
#update the openbox right-click menu (.openbox/menu.xml) to no longer show the removed programs, 
and update old links; also add in the LXDE programs (see slitaz_altering_programs script) 
#Change the run dialog from alt+F2 to alt+F1, the main menu from super+space to alt+F2, 
and the client menu from super+tab to alt+F3

In the sourceforge files , I added the file:///home/username/.config/openbox folder of Slitaz.
The idea is to replace the openbox file of Crunchbang to keep (most of) the keybinds
yet alter the programs to the lightweight alternatives used by slitaz. Obviously, we need
to have these programs download/install in the script as well.
 anyway, here are some of the changed programs:

For conky weather, see https://bbs.archlinux.org/viewtopic.php?id=139962
http://www.junauza.com/2014/06/best-weather-applications-for-linux.html
see http://crunchbanglinux.org/wiki/howto/howto_setup_multiple_conky_sessions for how to set up several conky sessions

the following is useful info for setting the openbox config files:
thunar --> replaced by PCManFM;
note that PCManFm also seems to handle the background, items, ...
when possible (I'm planning to introduce an easy wallpaper changer that works with some
website databases with backgrounds, for example of nature landscapes, ...), that should
be kept, if this won't be compatible, replace by feh (nitrogen exists too, but that's rather
heavy on resources)
catfish --> replaced by busybox's find utility
geany can be kept (slitaz uses Beaver, but I doubt this is better)
abiword is kept in standardly, alternatively use leafpad
tint2runtime is replaced by lxpanel
terminator is replaced by lxterminal
xfburn replaced by burnbox
xfce4screenshooter replaced by xwd
htop replaced by LXtask
file-roller is replaced by the inbuild compression in PCManFM, or xarchiver if not possible
evince is replaced palemoon's pdf reader
pavucontrol is changed with the SliTaz volume control (which is called alsamixer volume mixer I believe)
palemoon is made the main browser, tazweb is the second browser, no midori
