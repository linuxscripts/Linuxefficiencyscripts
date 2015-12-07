##########################################################################
#                    Linux_directorytree_changing                        #
# made by Brian Peregrine, released under the GNU General Public License #
##########################################################################

#Changing the mount points
there's a link at the forum mentioned to
https://en.wikiversity.org/wiki/Linux_adaptations_for_UMPC_design
In that article, see suggestion 2
(#Suggestion_2:_Altering_of_the_standard_Linux_directory_tree_structure)
Basically, the whole linux directory tree is unlogical, but with some
simple changes (making of new mount points and moving the
files/folders of the entire operating system to a underlying folder,
say /mnt/SATA1 if the operating system is on the first SATA, things get a
lot more logical.
For making the mount points, mount points can be made directly under /mnt, so for example /mnt/USB1 and /mnt/USB2 if there are 2 USB ports
found on the machine, ... The devices themselves remain at /dev 
The script could also install autofs (and automatically add a line to the
/etc/auto.master file; hereby making the mountpoints permanent if still needed -even
after reboot-)

#first lines should state: 
#the old linux device naming convention on the drives is detailed in-depth at https://archive.is/VAE8F  and https://archive.is/PoMnq (or http://www.tldp.org/HOWTO/Partition-Mass-Storage-Definitions-Naming-HOWTO/x99.html , and http://www.tldp.org/HOWTO/SCSI-2.4-HOWTO/dnames.html)
#you'll notice that PATA drive device names have names such as hda1, hda2 to hdb1, hdb2, depending on whether there connected on the first or second controller (belt) and whether they're master or slave;
#SATA drives as well as USB and firewire drives are indicated with the name "sda1" to "sdd4" (depending on how many drives are split on 1 connector), floppy drives are indicated with fd0, fd1, ... parallell port devices are indicated with lp0, lp1, ..., serial port devices are indicated with ttyS1, ttyS2, ... and scsi drives are indicated with sr0, sr1, ... or scd0, scd1 
#note hereby that with conventional PATA drives (so not scsi drives!), no initial differentiation is made on whether it's a cdrom or harddisk; however linux can detect what is a cdrom (or other optical drive, ie dvd, blueray, ...) using wodim, see https://archive.is/yi6li (or http://linuxconfig.org/how-to-mount-cdrom-in-linux ;
often your distro will put optical drives contents in a /mnt/cdrom folder or something similar; this feature will be removed and the system will just put it in /mnt/port_name)
#also note that with SATA drives, USB and firewire drives, no differentiation is made by linux; we can only distinguish these types by the udevinfo / system info, and perhaps dmesg info (see https://bbs.archlinux.org/viewtopic.php?id=31558 and https://serverfault.com/questions/270839/detect-specific-device-is-usb-sata-apart-from-dmesg-output)
#also note that SATA drives and other some other drives (USB sticks, firewire drives, ...) can change names (i.e. sda can become sdb and vice versa, every time you boot, see https://archive.is/fAnrq (or https://wiki.archlinux.org/index.php/Persistent_block_device_naming )
#similar to the linux directory tree changes here below, this script will solve all issues by making symbolic links of the regular linux device names, to more drive mount point names that make more sense to people.
#more precisely, it will make symbolic links from :
#hda (to hdd) --> /mnt/PATA1 to /mnt/PATA4
#sda (to sdd) (SATA) --> /mnt/SATA1 to /mnt/SATA4
#sda (to sdd) (USB -all versions-) --> /mnt/USB1 to /mnt/USB4
#sda (to sdd) (Firewire 400) --> /mnt/IEEE1394
#sda (to sdd) (Firewire 800) --> /mnt/IEEE1394b
#lp0 (to lp1) --> /mnt/ParallelP1 to /mnt/ParallelP2
#ttyS1 (to ttyS2) --> /mnt/SerialP1 to /mnt/SerialP2
#sr0 (to sr1) and scd0 (to scd1) --> /mnt/SCSI1, /mnt/SCSI2  
#it will remove any excess mount point folders (for example /media) if these are present on your linux distro
#it will also remove confusing device names, for example sr0, ... could refer to both SCSI devices as SATA devices
#the issue of the changing device names won't be solved completely (it will be easier to identify most drives though, but if you have say 2 SATA drives, it might still be a problem);
#however this minor issue can then be adressed by the user himself afterwards, by adding a uuid in /etc/fstab
#files to change may include /etc/mkinitcpio.conf and /etc/fstab, see https://bbs.archlinux.org/viewtopic.php?id=31558
