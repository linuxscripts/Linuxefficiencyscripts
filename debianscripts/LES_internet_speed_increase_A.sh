##########################################################################
#                      Internet speed increase A                         #
# made by Brian Peregrine, released under the GNU General Public License #
##########################################################################

#Note that the programs the script will install will be the converted debian (so slitaz) packages, not debian packages; if you have a plain debian distro, change the .tazpkg extension to .deb instead, and also change "tazpkg install" by "aptitude install"

#This script will
#Install ClamAV, ipkungfu, and SSHGuard

#!/bin/sh

#Convert debian packages to tazpkg packages (deactivate this by adding # before each line if you use a plain debian distro, and not a slitaz-based distro)
cd ~/files_internet_speed_increase_scripts/clamav/
tazpkg convert clamav-freshclam_0.98.6+dfsg-1_i386.deb
tazpkg convert clamav_0.98.6+dfsg-1_i386.deb
tazpkg convert libclamav6_0.98.6+dfsg-1_i386.deb
tazpkg convert libcurl3_7.38.0-4+deb8u2_i386.deb
tazpkg convert zlib1g_1.2.8.dfsg-2+b1_i386.deb
tazpkg convert libssl1.0.0_1.0.1k-3_i386.deb

cd ~/files_internet_speed_increase_scripts/ipkungfu/
tazpkg convert ipkungfu_0.6.1-6_i386.deb
tazpkg convert iproute_3.16.0-2_all.deb
tazpkg convert module-init-tools_18-3_all.deb

cd ~/files_internet_speed_increase_scripts/sshguard/
tazpkg convert sshguard_1.5-6_i386.deb
tazpkg convert iptables_1.4.21-2+b1_i386.deb
tazpkg convert libc6_2.19-18_i386.deb

#Install ClamAV
cd ~/files_internet_speed_increase_scripts/clamav/
tazpkg install clamav-freshclam_0.98.6+dfsg-1_i386.tazpkg
tazpkg install clamav_0.98.6+dfsg-1_i386.tazpkg
tazpkg install libclamav6_0.98.6+dfsg-1_i386.tazpkg
tazpkg install libcurl3_7.38.0-4+deb8u2_i386.tazpkg
tazpkg install zlib1g_1.2.8.dfsg-2+b1_i386.tazpkg
tazpkg install libssl1.0.0_1.0.1k-3_i386.tazpkg

#Install ipkungfu
cd ~/files_internet_speed_increase_scripts/ipkungfu/
tazpkg install ipkungfu_0.6.1-6_i386.tazpkg
tazpkg install iproute_3.16.0-2_all.tazpkg
tazpkg install module-init-tools_18-3_all.tazpkg

#Install SSHGuard
cd ~/files_internet_speed_increase_scripts/sshguard/
tazpkg install sshguard_1.5-6_i386.tazpkg
tazpkg install iptables_1.4.21-2+b1_i386.tazpkg
tazpkg install libc6_2.19-18_i386.tazpkg
