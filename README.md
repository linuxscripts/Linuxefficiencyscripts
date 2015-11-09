Linuxefficiencyscripts: A project creating scripts to improve computing efficiency
Note that "computing efficiency" relates to efficiency in terms of cpu speed for a given workload/tasks being carried out, as well as user efficiency (by making the linux system more logical to work with, which is essential for people new to linux as else, in the phase starting out with linux, people get less things done on a given amount of time, in comparison to other operating systems)

The speed increases would be accomplished by the installation of openbox (so as to allow people using much heavier window managers to switch to this instead), using lighter-weight alternatives to certain programs, as well as various changes to the browser (which amongst others reduces the stored internet history to a minimum and/or disable it for that session (non-persistence), allows the user to have fewer connections running for example by blocking ads, ...), by blocking unnecessary internet connections via a newly installed firewall, ... 

Regarding this github repository: the idea of this is to help facilitate cooperation on the scripts (they'ree currently still unfinished and need more work).
It DOES NOT contain all files, so if you want to download all the files, go retrieve them from sourceforge.

The script you need to run to install all LES scripts is LES_sequential_scripts_launcher.sh
This script will automatically launch all the other scripts, one-by-one.
To be able to run this, first make sure you are root (so if you aren't root all ready, become it first
by logging out and logging in as root and then follow the comment, given in the script itself, namely:
- type "touch LES_sequential_scripts_launcher.sh" in the terminal, followed by
- "chmod+x LES_sequential_scripts_launcher.sh" to make this script executable
- then, type "./LES_sequential_scripts_launcher.sh" to execute the script

Before executing the LES_sequential_scripts_launcher.sh script, please review the script using a program like geany, gedit, notepad++, ... Do the same with all the other scripts.
If you want the LES_sequential_scripts_launcher.sh script to not execute a specific other script, simply comment it out. Do the same on the other scripts for any programs you don't want to install. You will also notice that some programs or plugins have all ready been outcommented. To have the script download and/or install these, you have to remove the # before each of the commands. 

Depending on the linux distro you use, some commands in the script may not work. For example, installing a program by the "dpkg" command will not work on non-debian distro's. Instead, the command then needs to be changed to say "rpm" or "tazpkg", ... 

Overall, we rely on you to examine the scripts before execution, and alter all the non-compatible commands to suit your linux distro.

To start any of the scripts individually (without the using the automated LES_sequential_scripts_launcher.sh way), you'll have to manually type in "touch scriptname.sh" at the terminal, followed by "chmod+x scriptname.sh" to make the script executable. Then, type "./scriptname.sh" to execute the script

Specific notes on the scripts:
* For the LES_slitaz_altering_programs.sh script:
as mentioned in the script itself, a wallpaper folder will be made at /home/username/wallpapers;
to add in wallpapers to this folder, you'll need to download these manually from websites. A list is added below:

Non-linux-focused sites (which should also work, since for example feh can read PNG, TIFF and GIF so PCManFM should too); 
some of these allow to input search strings, other require you to browse per category:
- http://www.shutterstock.com/en/photos
- http://www.morguefile.com/archive
- http://www.adigitaldreamer.com/gallery/index.php
- http://www.deviantart.com/browse/all/resources/stockart/
- http://www.freeimages.co.uk/galleries.htm
- https://www.flickr.com/creativecommons/
- http://www.photocase.com/
- http://www.everystockphoto.com/
- http://freestockphotos.com/
- http://www.unprofound.com/
- http://www.freeimages.com/
- http://www.stockvault.net/
- http://www.freephotosbank.com/
- http://www.turbophoto.com/Free-Stock-Images/

Linux-focused sites (has wallpapers, and entire themes for openbox and other window managers)
- http://www.customize.org
- http://box-look.org
- http://www.gnome-look.org
- http://www.deviantart.com
- http://www.widewallpapers.net/
- http://www.wallpapervortex.com/
- http://www.distrogeeks.com/wallpapers/bodhi-linux/
- http://www.hdwallpapers.in/
- http://hdw.eweb4.com
- http://www.tmwallpaper.com/
- http://www.3dwallpaperstudio.com/
- http://good-wallpapers.com/
- http://wallpaperswide.com/
- http://xfce-look.org/
- http://kde-look.org/
- http://ubuntu-art.org/
