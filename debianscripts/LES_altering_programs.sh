##########################################################################
#                         altering_programs                              #
# made by Brian Peregrine, released under the GNU General Public License #
##########################################################################

#This script will
#Install retawq web browser (needed for web-based man checking)
#Install pypar2 (parchiver to prevent file corruption from transferring files online)
#Install HardInfo
#Install Gajim + OTR plugin
#Install Geany
#Install mpv
#Install abiword
#Install system-config-printer
#Install gmrun (run dialog)
#Install LXDE which includes:
#LXDE compiling dependencies
#menu-cache
#lxde-common
#lxmenu-data
#PCManFM
#LXPolkit
#LXpanel
#Leafpad
#Xarchiver
#GPicView
#LXTerminal
#Galculator
#LXTask
#LXAppearance
#LXRandr
#LXInput
#lxde-icon-theme
#It won't install the following parts of LXDE though: LXSession, LXDM, LXFind, LXMusic, LXAppearance Obconf ?, LXNM ? LXLauncher ?, LXShortCut ?
#Change the lxde-logout script to no longer show the buttons relying on LXSession
#Change the LXpanel configuration file (see http://wiki.lxde.org/en/LXPanel ) to look more like a dock, and change the programs it starts
#Install xscreensaver, together with 1 regular screensaver and a random image slideshow, picking images from /home/username/wallpapers
#Turn off GVFS in FileManFM
#Set up PCManFM to handle the desktop's wallpaper
#Make a wallpaper folder (at /home/username/wallpapers)
#Change the current wallpaper to a new one, which allows the conky data to be read easier

#Note that instead of the programs noted above, the following alternative programs can also be installed instead, by activating them in script, and outcommenting the program it replaces:
#Mplayer2 or DeaDBeeF instead of mpv
#Openoffice/Libreoffice writer (oowriter) instead of abiword (better than abiword in that it allows to copy/paste any text or tabels found online via the browser into its documents)

#The following programs can be installed optionally (may be necessary tools for some users); they're deactivated by default so activate them if you want them to install
#Claws mail (pop3 e-mail client; useful if you don't use a portable e-mailclient)
#GIMP (advanced image editing program, raster graphics editor)
#Inkscape (advanced image editing program, vector graphics editor)
#Gnumeric and Sozi or Openoffice Calc (oocalc) and Openoffice Impress (ooimpress) -for making spreadsheets and slideshows-
#Transmission (debian package included to scripts folder ?), useful for transferring files quickly, without fear of corrupting them during file transfer; pypar2 all ready provides the latter too though

#Note that there is no additional screenshot program added, but one can use xwd for this instead (all ready in X.org)

#!/bin/sh

#Install the programs mentioned above:
#Install retawq web browser (needed for web-based man checking)
dpkg-i retawq

#Install pypar2
cd ~/files_slitaz_altering_programs_script/pypar2/
dpkg-i pypar2_1.4-7_all.deb
dpkg-i par2_0.6.11-1_i386.deb
dpkg-i python-glade2_2.24.0-4_i386.deb
dpkg-i python-vte_0.28.2-5_i386.deb

#Install HardInfo
cd ~/files_slitaz_altering_programs_script/hardinfo/
dpkg-i hardinfo_0.5.1-1.4_i386.deb
dpkg-i libatk1.0-0_2.14.0-1_i386.deb
#dpkg-i libc6_2.19-18_i386.deb (all ready installed by sshguard, in other script)
dpkg-i libcairo2_1.14.0-2.1_i386.deb
dpkg-i libffi6_3.1-2+b2_i386.deb
dpkg-i libfontconfig1_2.11.0-6.3_i386.deb
dpkg-i libfreetype6_2.5.2-3_i386.deb
dpkg-i libgdk-pixbuf2.0-0_2.31.1-2+b1_i386.deb
#dpkg-i libglib2.0-0_2.42.1-1_i386.deb (all ready converted/installed by firefox, in other script)
#dpkg-i libgtk2.0-0_2.24.25-3_i386.deb (all ready installed by firefox; in other script)
dpkg-i liblzma5_5.1.1alpha+20120614-2+b3_i386.deb
dpkg-i libpango-1.0-0_1.36.8-3_i386.deb
dpkg-i libpangocairo-1.0-0_1.36.8-3_i386.deb
dpkg-i libpangoft2-1.0-0_1.36.8-3_i386.deb
dpkg-i libpcre3_8.35-3.3_i386.deb
dpkg-i libselinux1_2.3-2_i386.deb
dpkg-i libsoup2.4-1_2.48.0-1_i386.deb
dpkg-i libxml2_2.9.1+dfsg1-5_i386.deb
dpkg-i pciutils_3.2.1-3_i386.deb
#dpkg-i zlib1g_1.2.8.dfsg-2+b1_i386.deb (all ready installed by clamav)

#Install Gajim + OTR plugin (https://github.com/python-otr/gajim-otr)
cd ~/files_slitaz_altering_programs_script/gajim/
dpkg-i gajim_0.16-1_all.deb
dpkg-i dbus_1.8.16-1_i386.deb
dpkg-i dnsutils_9.9.5.dfsg-9_i386.deb
dpkg-i python_2.7.9-1_i386.deb
dpkg-i python-dbus_1.2.0-2+b3_i386.deb
dpkg-i python-gtk2_2.24.0-4_i386.deb
dpkg-i python-nbxmpp_0.5.1-2_all.deb
cp pure-python-otr-master /share/gajim/plugins/

#Install Geany
cd ~/files_slitaz_altering_programs_script/geany/
dpkg-i geany_1.24.1+dfsg-1_i386.deb
dpkg-i geany-common_1.24.1+dfsg-1_all.deb
#dpkg install libatk1.0-0_2.14.0-1_i386.deb (all ready installed by HardInfo)
#dpkg install libc6_2.19-18_i386.deb (all ready installed by sshguard, in other script)
#dpkg install libcairo2_1.14.0-2.1_i386.deb (all ready installed by HardInfo)
#dpkg install libfontconfig1_2.11.0-6.3_i386.deb (all ready installed by HardInfo)
#dpkg install libfreetype6_2.5.2-3_i386.deb (all ready installed by HardInfo)
dpkg-i libgcc1_4.9.2-10_i386.deb
#dpkg-i libgdk-pixbuf2.0-0_2.31.1-2+b1_i386.deb (all ready converted/installed by HardInfo)
#dpkg-i libglib2.0-0_2.42.1-1_i386.deb (all ready converted/installed by firefox, in other script)
#dpkg-i libgtk2.0-0_2.24.25-3_i386.deb (all ready installed by firefox; in other script)
#dpkg-i libpango-1.0-0_1.36.8-3_i386.deb (all ready converted/installed by HardInfo)
#dpkg-i libpangocairo-1.0-0_1.36.8-3_i386.deb (all ready converted/installed by HardInfo)
#dpkg-i libpangoft2-1.0-0_1.36.8-3_i386.deb (all ready converted/installed by HardInfo)
#dpkg-i libstdc++6_4.9.2-10_i386.deb (all ready converted/installed by firefox, in other script)
dpkg-i multiarch-support_2.19-18_i386.deb

#Install xscreensaver
cd ~/files_slitaz_altering_programs_script/xscreensaver/
dpkg-i xscreensaver_5.30-1+b1_i386.deb
#dpkg-i libatk1.0-0_2.14.0-1_i386.deb (all ready converted/installed by hardinfo)
#dpkg-i libc6_2.19-18_i386.deb (all ready converted/installed by sshguard, in other script)
#dpkg-i libcairo2_1.14.0-2.1_i386.deb (all ready converted/installed by hardinfo)
#dpkg-i libfontconfig1_2.11.0-6.3_i386.deb (all ready converted/installed by hardinfo)
#dpkg-i libfreetype6_2.5.2-3_i386.deb (all ready converted/installed by hardinfo)
#dpkg-i libgdk-pixbuf2.0-0_2.31.1-2+b1_i386.deb (all ready converted/installed by hardinfo)
dpkg-i libglade2-0_2.6.4-2_i386.deb
#dpkg-i libglib2.0-0_2.42.1-1_i386.deb (all ready converted/installed by firefox, in other script)
#dpkg-i libgtk2.0-0_2.24.25-3_i386.deb (all ready converted/installed by firefox, in other script) 
dpkg-i libice6_1.0.9-1+b1_i386.deb
dpkg-i libpam0g_1.1.8-3.1_i386.deb
#dpkg-i libpango-1.0-0_1.36.8-3_i386.deb (all ready converted/installed by hardinfo)
#dpkg-i libpangocairo-1.0-0_1.36.8-3_i386.deb (all ready converted/installed by hardinfo)
#dpkg-i libpangoft2-1.0-0_1.36.8-3_i386.deb (all ready converted/installed by hardinfo)
dpkg-i libsm6_1.2.2-1+b1_i386.deb
dpkg-i libx11-6_1.6.2-3_i386.deb
dpkg-i libxext6_1.3.3-1_i386.deb
dpkg-i libxi6_1.7.4-1+b2_i386.deb
dpkg-i libxinerama1_1.1.3-1+b1_i386.deb
#dpkg-i libxml2_2.9.1+dfsg1-5_i386.deb (all ready converted/installed by hardinfo)
dpkg-i libxmu6_1.1.2-1_i386.deb
dpkg-i libxpm4_3.5.11-1+b1_i386.deb
dpkg-i libxrandr2_1.4.2-1+b1_i386.deb
dpkg-i libxrender1_0.9.8-1+b1_i386.deb
dpkg-i libxt6_1.1.4-1+b1_i386.deb
dpkg-i libxxf86vm1_1.1.3-1+b1_i386.deb
dpkg-i xscreensaver-data_5.30-1+b1_i386.deb

#Install abiword
cd ~/files_slitaz_altering_programs_script/abiword/
dpkg-i abiword_3.0.0-8+b1_i386.deb
dpkg-i abiword-common_3.0.0-8_all.deb
dpkg-i gsfonts_8.11+urwcyr1.0.7~pre44-4.2_all.deb
dpkg-i libabiword-3.0_3.0.0-8+b1_i386.deb
#dpkg-i libc6_2.19-18_i386.deb (all ready converted/installed by sshguard, in other script)
dpkg-i libdbus-1-3_1.8.16-1_i386.deb
dpkg-i libdbus-glib-1-2_0.102-1_i386.deb
dpkg-i libgcc1_4.9.2-10_i386.deb
dpkg-i libgcrypt20_1.6.3-2_i386.deb
#dpkg-i libglib2.0-0_2.42.1-1_i386.deb (all ready converted/installed by firefox, in other script)
dpkg-i libgnutls-deb0-28_3.3.8-6_i386.deb
dpkg-i libgoffice-0.10-10_0.10.18-1_i386.deb
dpkg-i libgsf-1-114_1.14.30-2_i386.deb
#dpkg-i libgtk-3-0_3.14.5-1_i386.deb (all ready converted/installed by galculator)
#dpkg-i libjpeg62-turbo_1.3.1-12_i386.deb (all ready converted/installed by mpv)
dpkg-i libloudmouth1-0_1.4.3-12_i386.deb
dpkg-i libots0_0.5.0-2.1_i386.deb
dpkg-i libpng12-0_1.2.50-2+b2_i386.deb
dpkg-i librdf0_1.0.17-1+b1_i386.deb
dpkg-i libreadline6_6.3-8+b3_i386.deb
dpkg-i librevenge-0.0-0_0.0.1-3_i386.deb
#dpkg-i libsoup2.4-1_2.48.0-1_i386.deb (all ready installed by hardinfo)
#dpkg-i libstdc++6_4.9.2-10_i386.deb (all ready converted/installed by firefox, in other script)
dpkg-i libtelepathy-glib0_0.24.1-1_i386.deb
dpkg-i libtidy-0.99-0_20091223cvs-1.4_i386.deb
dpkg-i libwmf0.2-7_0.2.8.4-10.3+b2_i386.deb
dpkg-i libwpd-0.10-10_0.10.0-2+b1_i386.deb
dpkg-i libwpg-0.3-3_0.3.0-3_i386.deb
dpkg-i libwps-0.3-3_0.3.0-2_i386.deb
dpkg-i libxml2_2.9.1+dfsg1-5_i386.deb
#dpkg-i zlib1g_1.2.8.dfsg-2+b1_i386.deb (all ready converted/installed by clamav)

#Install system-config-printer (automatic printer installation program; rather heavy though, so if you don't have a printer or do not need to be able to use it with this PC uncomment this whole section; also note that a lighter-weight alternative is a manual install using cups along with additional printer drivers -like gutenprint, hplip, ...-, see https://wiki.debian.org/SystemPrinting, http://doc.slitaz.org/en:guides:printer). This latter option is more difficult to set up though
cd ~/files_slitaz_altering_programs_script/system_config_printer/
dpkg-i system-config-printer_1.4.6-1_all.deb
dpkg-i gir1.2-gdkpixbuf-2.0.deb
dpkg-i gir1.2-glib-2.0_1.42.0-2.2_i386.deb
dpkg-i gir1.2-gtk-3.0_3.14.5-1_i386.deb
dpkg-i gir1.2-notify-0.7_0.7.6-2_i386.deb
dpkg-i gir1.2-packagekitglib-1.0_1.0.1-2_i386.deb
dpkg-i gir1.2-pango-1.0_1.36.8-3_i386.deb
dpkg-i gnome-icon-theme_3.12.0-1_all.deb
#dpkg-i python_2.7.9-1_i386.deb (all ready installed by gajim)
dpkg-i python-cairo_1.8.8-1+b2_i386.deb
dpkg-i python-cups_1.9.63-1_i386.deb
dpkg-i python-cupshelpers_1.4.6-1_all.deb
dpkg-i python-gi_3.14.0-1_i386.deb
dpkg-i python-gobject-2_2.28.6-12_i386.deb
dpkg-i python-libxml2_2.9.1+dfsg1-5_i386.deb

#Install gmrun
cd ~/files_slitaz_altering_programs_script/gmrun/
dpkg-i gmrun_0.9.2-2.1_i386.deb
#dpkg-i libatk1.0-0_2.14.0-1_i386.deb (all ready converted/installed by hardinfo)
#dpkg-i libc6_2.19-18_i386.deb (all ready converted/installed by sshguard, in other script)
#dpkg-i libcairo2_1.14.0-2.1_i386.deb (all ready converted/installed by hardinfo)
#dpkg-i libfontconfig1_2.11.0-6.3_i386.deb (all ready converted/installed by hardinfo)
#dpkg-i libfreetype6_2.5.2-3_i386.deb (all ready converted/installed by hardinfo)
#dpkg-i libgcc1_4.9.2-10_i386.deb (all ready converted/installed by geany)
#dpkg-i libgdk-pixbuf2.0-0_2.31.1-2+b1_i386.deb (all ready converted/installed by hardinfo)
#dpkg-i libglib2.0-0_2.42.1-1_i386.deb (all ready converted/installed by firefox, in other script)
#dpkg-i libgtk2.0-0_2.24.25-3_i386.deb (all ready converted/installed by firefox, in other script) 
#dpkg-i libpango-1.0-0_1.36.8-3_i386.deb (all ready converted/installed by hardinfo)
#dpkg-i libpangocairo-1.0-0_1.36.8-3_i386.deb (all ready converted/installed by hardinfo)
#dpkg-i libpangoft2-1.0-0_1.36.8-3_i386.deb (all ready converted/installed by hardinfo)

#Install mpv
cd ~/files_slitaz_altering_programs_script/mpv/
dpkg-i mpv_0.6.2-2_i386.deb
dpkg-i libasound2_1.0.28-1_i386.deb
dpkg-i libass5_0.10.2-3_i386.deb
dpkg-i libatomic1_4.9.2-10_i386.deb
dpkg-i libavcodec56_11.3-1_i386.deb
dpkg-i libavdevice55_11.3-1_i386.deb
dpkg-i libavfilter5_11.3-1_i386.deb
dpkg-i libavformat56_11.3-1_i386.deb
dpkg-i libavresample2_11.3-1_i386.deb
dpkg-i libavutil54_11.3-1_i386.deb
dpkg-i libbluray1_0.6.2-1_i386.deb
dpkg-i libbs2b0_3.1.0+dfsg-2.1_i386.deb
#dpkg-i libc6_2.19-18_i386.deb (all ready converted/installed by sshguard, in other script)
dpkg-i libcdio13_0.83-4.2_i386.deb
dpkg-i libcdio-cdda1_0.83-4.2_i386.deb
dpkg-i libcdio-paranoia1_0.83-4.2_i386.deb
dpkg-i libdvdnav4_5.0.1-1_i386.deb
dpkg-i libdvdread4_5.0.0-1_i386.deb
dpkg-i libegl1-mesa_10.3.2-1_i386.deb
dpkg-i libenca0_1.16-1_i386.deb
dpkg-i libgl1-mesa-glx_10.3.2-1_i386.deb
dpkg-i libguess1_1.2-1_i386.deb
dpkg-i libjack-jackd2-0_1.9.10+20140719git3eb0ae6a~dfsg-2_i386.deb
dpkg-i libjpeg62-turbo_1.3.1-12_i386.deb
dpkg-i liblcms2-2_2.6-3+b3_i386.deb
dpkg-i liblircclient0_0.9.0~pre1-1.2_i386.deb
dpkg-i liblua5.2-0_5.2.3-1.1_i386.deb
dpkg-i libmpg123-0_1.20.1-2_i386.deb
dpkg-i libpulse0_5.0-13_i386.deb
dpkg-i libquvi7_0.4.1-3_i386.deb
dpkg-i libsdl2-2.0-0_2.0.2+dfsg1-6_i386.deb
dpkg-i libswscale3_11.3-1_i386.deb
dpkg-i libuuid1_2.25.2-6_i386.deb
dpkg-i libva1_1.4.1-1_i386.deb
dpkg-i libva-glx1_1.4.1-1_i386.deb
dpkg-i libva-x11-1_1.4.1-1_i386.deb
dpkg-i libvdpau1_0.8-3_i386.deb
dpkg-i libwayland-client0_1.6.0-2_i386.deb
dpkg-i libwayland-cursor0_1.6.0-2_i386.deb
dpkg-i libwayland-egl1-mesa_10.3.2-1_i386.deb
#dpkg-i libx11-6_1.6.2-3_i386.deb (all ready converted/installed by xscreensaver)
#dpkg-i libxext6_1.3.3-1_i386.deb (all ready converted/installed by xscreensaver)
#dpkg-i libxinerama1_1.1.3-1+b1_i386.deb (all ready converted/installed by xscreensaver)
dpkg-i libxkbcommon0_0.4.3-2_i386.deb
#dpkg-i libxrandr2_1.4.2-1+b1_i386.deb (all ready converted/installed by xscreensaver)
dpkg-i libxss1_1.2.2-1_i386.deb
dpkg-i libxv1_1.0.10-1+b1_i386.deb
#dpkg-i zlib1g_1.2.8.dfsg-2+b1_i386.deb (all ready converted/installed by clamav)

#Install LXDE compiling dependencies
cd ~/files_slitaz_altering_programs_script/LXDE/LXDE_dependencies_compiling/
dpkg-i libtool_2.4.2-1.11_all.deb
dpkg-i intltool_0.50.2-2_all.deb
dpkg-i libfm-gtk4_1.2.3-1_i386.deb
dpkg-i libwnck-3-0_3.4.9-3_i386.deb
dpkg-i libkeybinder-3.0-0_0.3.0-1_i386.deb
dpkg-i libfm-extra4_1.2.3-1_i386.deb

#Install menu-cache (see http://www.linuxfromscratch.org/blfs/view/7.6/lxde/menu-cache.html )
cd ~/files_slitaz_altering_programs_script/LXDE/menu-cache-1.0.0/
./configure --prefix=/usr \
            --with-extra-only
make
make install

#Install lxde-common
cd ~/files_slitaz_altering_programs_script/LXDE/lxde-common-0.99.0/
./configure
make
make install

#Install lxmenu-data (see http://www.linuxfromscratch.org/blfs/view/7.6/lxde/lxmenu-data.html )
cd ~/files_slitaz_altering_programs_script/LXDE/lxmenu-data-0.1.4/
./configure --prefix=/usr --sysconfdir=/etc &&
make
make install

#Install PCManFM (see www.linuxfromscratch.org/blfs/view/cvs/lxde/pcmanfm.html)
cd ~/files_slitaz_altering_programs_script/LXDE/pcmanfm-1.2.3/
./configure --prefix=/usr --sysconfdir=/etc &&
make
make install
sed -i 's/System;//' /usr/share/applications/pcmanfm.desktop
./

#Install LXPolkit (see http://www.linuxfromscratch.org/blfs/view/7.6/lxde/lxpolkit.html )
cd ~/files_slitaz_altering_programs_script/LXDE/lxpolkit-0.1.0/
./configure --prefix=/usr \ --sysconfdir=/etc &&
make
make install

#Install LXpanel (needs to be installed, after menu-cache, see http://www.linuxfromscratch.org/blfs/view/7.6/lxde/lxpanel.html and http://wiki.lxde.org/en/LXPanel )
cd ~/files_slitaz_altering_programs_script/LXDE/lxpanel-0.8.1/
 ./autogen.sh
 ./configure
 make
 make install

#Install Leafpad
cd ~/files_slitaz_altering_programs_script/LXDE/leafpad/
dpkg-i leafpad_0.8.18.1-4_i386.deb
#dpkg-i libc6_2.19-18_i386.deb (all ready installed by sshguard, in other script)
#dpkg-i libglib2.0-0_2.42.1-1_i386.deb (all ready converted/installed by firefox, in other script)
#dpkg-i libgtk2.0-0_2.24.25-3_i386.deb (all ready converted/installed by firefox, in other script)
#dpkg-i libcairo2_1.14.0-2.1_i386.deb (all ready converted/installed by hardinfo)
#dpkg-i libpango-1.0-0_1.36.8-3_i386.deb (all ready converted/installed by hardinfo)
#dpkg-i libpangocairo-1.0-0_1.36.8-3_i386.deb (all ready converted/installed by hardinfo)

#Install Xarchiver
cd ~/files_slitaz_altering_programs_script/LXDE/xarchiver/
dpkg-i xarchiver_0.5.4-1_i386.deb
#dpkg-i libc6_2.19-18_i386.deb (all ready converted/installed by sshguard, in other script)
#dpkg-i libgdk-pixbuf2.0-0_2.31.1-2+b1_i386.deb (all ready converted/installed by hardinfo)
#dpkg-i libglib2.0-0_2.42.1-1_i386.deb (all ready converted/installed by firefox, in other script)
#dpkg-i libgtk2.0-0_2.24.25-3_i386.deb (all ready converted/installed by firefox, in other script)
#dpkg-i libpango-1.0-0_1.36.8-3_i386.deb (all ready converted/installed by hardinfo)

#Install GPicView (see http://www.linuxfromscratch.org/blfs/view/7.6/lxde/gpicview.html )
cd ~/files_slitaz_altering_programs_script/LXDE/gpicview-0.2.4/
./configure --prefix=/usr &&
make
make install &&
sed -i 's/Utility;//' /usr/share/applications/gpicview.desktop

#Install LXTerminal (see http://www.linuxfromscratch.org/blfs/view/7.6/lxde/lxterminal.html)
cd ~/files_slitaz_altering_programs_script/LXDE/lxterminal-0.2.0/
./configure --prefix=/usr &&
make
make install

#Install Galculator
cd ~/files_slitaz_altering_programs_script/LXDE/galculator/
dpkg-i galculator_2.1.3-1_i386.deb
#dpkg -i libc6_2.19-18_i386.deb (all ready converted/installed by sshguard, in other script)
#dpkg-i libglib2.0-0_2.42.1-1_i386.deb (all ready converted/installed by firefox, in other script)
dpkg-i libgtk-3-0_3.14.5-1_i386.deb
#dpkg-i libpango-1.0-0_1.36.8-3_i386.deb (all ready converted/installed by hardinfo)
dpkg-i libquadmath0_4.9.2-10_i386.deb

#Install LXTask (see http://www.linuxfromscratch.org/blfs/view/7.6/lxde/lxtask.html)
cd ~/files_slitaz_altering_programs_script/LXDE/lxtask-0.1.6/
./configure --prefix=/usr &&
make
make install

#Install LXAppearance (see http://www.linuxfromscratch.org/blfs/view/7.6/lxde/lxappearance.html )
cd ~/files_slitaz_altering_programs_script/LXDE/lxappearance-0.6.1/
./configure --prefix=/usr     \
            --sysconfdir=/etc \
            --disable-static  \
            --enable-dbus     &&
make
make install

#Install LXRandr (see http://www.linuxfromscratch.org/blfs/view/7.6/lxde/lxrandr.html )
cd ~/files_slitaz_altering_programs_script/LXDE/lxrandr-0.3.0/
./configure --prefix=/usr &&
make
make install

#Install LXShortcut (see http://www.linuxfromscratch.org/blfs/view/7.5/lxde/lxshortcut.html )
cd ~/files_slitaz_altering_programs_script/LXDE/lxshortcut-0.1.2/
./configure --prefix=/usr &&
make
make install

#Install LXInput (see http://www.linuxfromscratch.org/blfs/view/7.6/lxde/lxinput.html)
cd ~/files_slitaz_altering_programs_script/LXDE/lxinput-0.3.4/
./configure --prefix=/usr &&
make
make install

#Install lxde-icon-theme (see http://www.linuxfromscratch.org/blfs/view/7.7/lxde/lxde-icon-theme.html )
cd ~/files_slitaz_altering_programs_script/openbox_themes/lxde-icon-theme-0.5.1
./configure --prefix=/usr
make install
gtk-update-icon-cache -qf /usr/share/icons/nuoveXT2

#Change the lxde-logout script to no longer show the buttons relying on LXSession
?

#Change the LXpanel configuration file (see http://wiki.lxde.org/en/LXPanel ) to look more like a dock, and change the programs it starts
cd ~/files_slitaz_altering_programs_script/lxpanel_configs/
cp 

#Turn off GVFS in FileManFM (see http://wiki.lxde.org/en/LXDE:PCManFM_build_and_setup_guide )
export GIO_USE_VFS="local"
export GIO_USE_VOLUME_MONITOR="unix"

#Set up PCManFM to handle the desktop's wallpaper (see http://wiki.lxde.org/en/PCManFM , and http://www.simplehelp.net/2008/12/24/linux-command-line-magic-find-and-replace/)
mkdir ~/Desktop
sed -i ‘s/XDG_DESKTOP_DIR="$HOME"/XDG_DESKTOP_DIR="$HOME/Desktop"/’ /.config/user-dirs.dirs

#Make a wallpaper folder (at /home/username/wallpapers)
cd ~/files_slitaz_altering_programs_script/
cp wallpapers /home/*/wallpapers

#Set xscreensaver to a random image slideshow, picking images from /home/username/wallpapers
cd ~/files_slitaz_altering_programs_script/xscreensaver_config_files/
cp -f .xscreensaver /usr/lib/X11/app-defaults/XScreenSaver/.xscreensaver

#Change the current wallpaper to a new one, which allows the conky data to be read easier
pcmanfm --set-wallpaper=/home/*/wallpapers/transparent_solid_colour.png

#Install the optional programs (not supplied as off-line package; see http://doc.slitaz.org/en:handbook:packages )
#Install Claws mail
#apt-get install claws-mail

#Install GIMP
#apt-get installl gimp

#Install Inkscape
#apt-get install inkscape

#Install Gnumeric
#apt-get install gnumeric

#Install Sozi
#apt-get install sozi

#Install Transmission
#apt-get install transmission
