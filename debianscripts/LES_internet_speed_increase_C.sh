##########################################################################
#                      Internet speed increase C                         #
# made by Brian Peregrine, released under the GNU General Public License #
##########################################################################

#This script will
#Install youtube-viewer
#Install firejail (= a sandboxing program ) and make a profile for the Pale Moon browser

#Note that the programs the script will install will be the converted debian (so slitaz) packages, not debian packages; if you have a plain debian distro, change the .tazpkg extension to .deb instead and also change "tazpkg install" by "aptitude install""

#!/bin/sh

cd ~/files_internet_speed_increase_scripts/youtube-viewer_dependencies/
dpkg-i libdata-dump-perl_1.22-1_all.deb
dpkg-i libgtk2-perl_1.2492-4_i386.deb
dpkg-i libwww-perl_6.08-1_all.deb
dpkg-i gcap_0.1.1-1_all.deb
dpkg-i libterm-readline-gnu-perl_1.24-2+b1_i386.deb
dpkg-i liblwp-protocol-https-perl_6.06-2_all.deb
dpkg-i libterm-readkey-perl_2.32-1+b1_i386.deb
sudo cpan -i XML::Fast
./Build.PL
./Build
./Build test
./Build install --install_path script=/usr/bin


#Install firejail, and copy all ready made profiles for other programs -besides Firefox, as a profile is all ready standardly included for this- (see https://l3net.wordpress.com/2014/09/19/firejail-a-security-sandbox-for-mozilla-firefox/ and https://l3net.wordpress.com/2015/02/19/firejail-a-security-sandbox-for-mozilla-firefox-part-2/ and https://l3net.wordpress.com/projects/firejail/building-custom-profiles/ )
cd ~/files_internet_speed_increase_scripts/
dpkg-i firejail_0.9.26_1_i386.deb
./configure
make
make install
cd ~/files_internet_speed_increase_scripts/firejailprofiles/
cp *.profile /etc/firejail/
