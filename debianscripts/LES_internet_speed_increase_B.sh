##########################################################################
#                      Internet speed increase B                         #
# made by Brian Peregrine, released under the GNU General Public License #
##########################################################################

#Note: at the start of a new task, the directory is changed with cd; allowing the use of relative pathnames (not beginning with a forward slash (/). If a file is copied or moved, the destination is always given with an absolute pathname however (hence starting with a forward slash (/)

#This script will
#Install Firefox (version that is known to work; current version from folder; note that it also doubles as pdf reader so no standalone pdf reader -like ePDFView- is needed to be installed any more)
#Install Flash player
#Install firefox plugins (from the files_internet_speed_increase_scripts/firefox_plugins/ folder, including: SSL search bar, Calomel SSL Validation, HTTPS Everywhere, User agent overrider, Noscript, uBlock, Disconnect); note that Disconnect is deactivated by default (as uBlock will all ready block most Disconnect blocks anyway -Disconnect just offers the benefit of showing what's blocked in detail-), Flash is blocked by Noscript too btw, and has been set in the preferences config to not automatically run; however if Noscript is disabled temporarily, and thus flash allowed to run, the browser can still show flash animations. For the ssl search bars: Duckduckgo, ixquick and Google are made available. For the user agent overrider, see the html page.
#Copy the Post-installation instructions html to the /home/<username>/Downloads folder

#!/bin/sh

#Install Firefox with custom omni.ja; see https://support.mozilla.org/si/kb/Linux%20%E0%B6%B8%E0%B6%AD%20%E0%B7%86%E0%B6%BA%E0%B6%BB%E0%B7%8A%E0%B7%86%E0%B7%9C%E0%B6%9A%E0%B7%8A%E0%B7%83%E0%B7%8A%20%E0%B7%83%E0%B7%8A%E0%B6%AE%E0%B7%8F%E0%B6%B4%E0%B6%B1%E0%B6%BA and https://www.mozilla.org/en-US/firefox/38.0.1/system-requirements/ Note that the omni.ja holds the about:preferences and about:config config files, see https://mike.kaply.com/2012/03/15/customizing-firefox-default-preference-files/
cd ~/files_internet_speed_increase_scripts/
cp firefox /usr/local/

cd ~/files_internet_speed_increase_scripts/firefox_dependencies/
dpkg-i libgtk2.0-0_2.24.25-3_i386.deb
dpkg-i libstdc++6_4.9.2-10_i386.deb
dpkg-ilibglib2.0-0_2.42.1-1_i386.deb
dpkg-i network-manager_0.9.10.0-7_i386.deb
dpkg-i dbus_1.8.16-1_i386.deb
dpkg-i hal_0.5.14-8_i386.deb
dpkg-i gnome_3.14+3_i386.deb

cd ~/files_internet_speed_increase_scripts/firefox_dependencies/pango-1.36.8/
./configure 
make
make install

#Copy the modified preferences files to the firefox folder so it uses these modified settings rather than the standard settings, see https://mike.kaply.com/2012/03/15/customizing-firefox-default-preference-files/
cd ~/files_internet_speed_increase_scripts/firefox_updated_settings/
cp Updated_about_config_settings.cfg /firefox
cp autoconfig.js /usr/local/firefox/defaults/pref/

#Install Flash player; see https://helpx.adobe.com/flash-player/release-note/readme-flash-player-linux.html
cd ~/files_internet_speed_increase_scripts/flashplayer11-2-202460-targz/
cp usr/bin/* /usr/bin/
cp usr/lib/kde4/* /usr/lib/
cp usr/share/applications/* /usr/share/applications/
cp usr/share/icons/hicolor/16x16/apps/* /usr/share/icons/hicolor/16x16/apps/
cp usr/share/icons/hicolor/22x22/apps/* /usr/share/icons/hicolor/22x22/apps/
cp usr/share/icons/hicolor/24x24/apps/* /usr/share/icons/hicolor/24x24/apps/
cp usr/share/icons/hicolor/32x32/apps/* /usr/share/icons/hicolor/32x32/apps/
cp usr/share/icons/hicolor/48x48/apps/* /usr/share/icons/hicolor/48x48/apps/
cp usr/share/pixmaps/* /usr/share/pixmaps/
cp libflashplayer.so /usr/local/firefox/browser/extensions/

#Delete non-SSL search engines and install SSL search engines in browser search bar; see http://kb.mozillazine.org/Search_Bar
cd ~/usr/local/firefox/browser/searchplugins/
rm *

cd ~/files_internet_speed_increase_scripts/firefox_plugins/SSL search bars/
cp duckduckgo__ssl_-20101029.xml /usr/local/firefox/browser/searchplugins/
cp google_ssl-20111022.xml /usr/local/firefox/browser/searchplugins/
cp ixquick__ssl_-20101029.xml /usr/local/firefox/browser/searchplugins/

#Install Firefox plugins; see http://kb.mozillazine.org/Installing_extensions
cd ~/files_internet_speed_increase_scripts/firefox_plugins/
cp calomel_ssl_validation-0.75-fx.xpi /usr/local/firefox/browser/extensions/
cp uBlock-0.9.1.0-an+fx.xpi /usr/local/firefox/browser/extensions/
#cp disconnect-3.15.3-fx.xpi /usr/local/firefox/browser/extensions/
cp https-everywhere-5.0.4.xpi /usr/local/firefox/browser/extensions/
cp noscript-2.6.9.22.xpi /usr/local/firefox/browser/extensions/
cp user_agent_overrider-0.2.5-fx.xpi /usr/local/firefox/browser/extensions/

#Copy the Post-installation instructions html to the /home/<username>/up_and_downloads/ folder; note that the post-installation instructions html will also be your made your startpage by the updated files handling the Preferences and about:config in Firefox
cd ~/files_other/
cp Postinstallation.html /home/*/up_and_downloads/Postinstallation.html

#Display messagebox that the Firefox browser needs to be restarted before changes take effect (see http://stackoverflow.com/questions/7035/how-to-show-a-message-box-from-a-bash-script-in-linux). Note that a standard kill9 hasn't been used since that doesn't allow to shut down any program cleanly, see https://www.reddit.com/r/linux/comments/1xvr25/linux_tip_dont_use_kill_9/
notify-send "Restart the Firefox browser for changes to take effect"
