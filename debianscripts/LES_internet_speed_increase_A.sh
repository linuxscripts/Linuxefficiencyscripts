##########################################################################
#                      Internet speed increase A                         #
# made by Brian Peregrine, released under the GNU General Public License #
##########################################################################

#This script will
#Install ClamAV, ipkungfu, and SSHGuard

#!/bin/sh

#Install ClamAV
cd ~/files_internet_speed_increase_scripts/clamav/
dpkg-i clamav-freshclam_0.98.6+dfsg-1_i386.deb
dpkg-i clamav_0.98.6+dfsg-1_i386.deb
dpkg-i libclamav6_0.98.6+dfsg-1_i386.deb
dpkg-i libcurl3_7.38.0-4+deb8u2_i386.deb
dpkg-i zlib1g_1.2.8.dfsg-2+b1_i386.deb
dpkg-i libssl1.0.0_1.0.1k-3_i386.deb

#Install ipkungfu
cd ~/files_internet_speed_increase_scripts/ipkungfu/
dpkg-i ipkungfu_0.6.1-6_i386.deb
dpkg-i iproute_3.16.0-2_all.deb
dpkg-i module-init-tools_18-3_all.deb

#Install SSHGuard
cd ~/files_internet_speed_increase_scripts/sshguard/
dpkg-i sshguard_1.5-6_i386.deb
dpkg-i iptables_1.4.21-2+b1_i386.deb
dpkg-i libc6_2.19-18_i386.deb
