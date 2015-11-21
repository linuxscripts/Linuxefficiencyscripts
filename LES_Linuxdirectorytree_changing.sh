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
say /SATA1 if the operating system is on the first SATA, things get a
lot more logical.
For making the mount points, mount points can be made directly at the
root (/), so for example /USB1 and /USB2 if there are 2 USB ports
found on the machine, ... The script should also install autofs (and
automatically add a line to the
/etc/auto.master file; hereby making the mountpoints permanent -even
after reboot-)

#first lines should state: 
#the old linux naming convention on the drives is detailed in-depth at https://archive.is/VAE8F (and http://www.tldp.org/HOWTO/Partition-Mass-Storage-Definitions-Naming-HOWTO/x99.html )
#you'll notice that PATA drives are given names such as hda to hdb, depending on whether there connected on the first or second controller (belt) and whether they're master or slave;
no initial differentiation is made on whether it's a cdrom or harddisk; however linux can detect what is a cdrom (or other optical drive, ie dvd, blueray, ...) using wodim, see https://archive.is/yi6li (or http://linuxconfig.org/how-to-mount-cdrom-in-linux )
#also note that SATA drives and other some other drives (USB sticks, ...) can change names (i.e. sda can become sdb and vice versa, every time you boot, see https://archive.is/fAnrq (or https://wiki.archlinux.org/index.php/Persistent_block_device_naming )
#similar to the linux directory tree changes here below, this script will solve all issues by making symbolic links of the regular linux drive names, to more drive names that make more sense to people.
#files to change may include /etc/mkinitcpio.conf and /etc/fstab, see https://bbs.archlinux.org/viewtopic.php?id=31558

types of drives


#Changing the linux directory tree

#!/bin/sh


#####################################################################
#
# CreateRootlessEnvironment
# Andre Detsch, Renato Costa, Dan
#
#####################################################################

CURRENT_SCRIPTS_VERSION=2.5.2 # This variable is automatically set by Make
hostSystemDependencies=(
   sh mv cp ls find sed grep
   python
   seq
)


###############################################################################
# help message on $1 == --help
###############################################################################

if [ "$1" = "--help" -o  "$1" = "-help" -o "$1" = "-h" ] 
then
   echo "GoboLinux Rootless environment creation script"
   echo "Copyright (C) Andre Detsch, 2004-2005 - Released under the GNU GPL."
   echo "Usage: $0 [<prefix>]"
   echo "Default prefix is ${HOME}"
   exit 1
fi


###############################################################################
# Checking for required tools
###############################################################################

# Note: wget is not required when running on a GoboLinux box
if [ ! -e "/Programs/Scripts/Current" -a ! "`which wget`" ]
then 
    echo "Please install wget in order to run this script."
    exit 1
fi

for app in "${hostSystemDependencies[@]}"; do
   if [ ! "`which "$app"`" ]; then
      echo "For Rootless GoboLinux requires $app."
      echo 1
   fi
done


###############################################################################
# Preparing env variables
###############################################################################

[ ! "$ROOTLESS_GOBOLINUX" ] && export ROOTLESS_GOBOLINUX=1

# default goboPrefix is ${HOME}
if [ "$1" ] 
then
   export goboPrefix="$1"
else
   export goboPrefix=${HOME}
fi

# Saves the current directory for latter restoration
pwd=$PWD


###############################################################################
# Startup message and 'press a key to continue'
###############################################################################

echo "You have choose to create Rootless enviroment at" 
echo "${goboPrefix}"
echo "Press any key to continue or Ctrl+C to abort."
read
echo


###############################################################################
# Preparing stub tree
###############################################################################

for dir in \
.Settings \
Programs \
System \
System/Links \
System/Links/Environment \
System/Links/Executables \
System/Links/Headers \
System/Links/Libraries \
System/Links/Manuals \
System/Links/Manuals/man{0,1,2,3,4,5,6,7,8} \
System/Links/Shared \
System/Links/Tasks \
System/Settings \
System/Variable
do
   [ -e "${goboPrefix}/$dir" ] || { echo "Creating ${goboPrefix}/$dir"; mkdir -p "${goboPrefix}/$dir"; }
done

# Rootless uses /tmp as tmp directory
[ -e "${goboPrefix}/System/Variable/tmp" ] || ln -sfn "/tmp" "${goboPrefix}/System/Variable/tmp"


###############################################################################
# Creating Rootless package
###############################################################################

mkdir -p "${goboPrefix}/Programs/Rootless/1.0/bin"
cd "${goboPrefix}/Programs/Rootless/"
ln -sfn "1.0" "Current"

if [ "${goboPrefix}" = "${HOME}" ]
then
   rootlessPrefix='${HOME}'
else
   rootlessPrefix="${goboPrefix}"
fi

echo -n '#!/bin/sh (source)
export ROOTLESS_GOBOLINUX=1
alias SymlinkProgram="SymlinkProgram --relative"

[ ! "$goboPrefix" ] && export goboPrefix='$rootlessPrefix'

if [ "${ZSH_NAME}" = "zsh" ]
then
   [ -e "${goboPrefix}/System/Settings/zshrc" ] && . "${goboPrefix}/System/Settings/zshrc"
   prompt lode cyan
elif [ "${SHELL}" = "/bin/bash" ]
then
   [ -e "${goboPrefix}/System/Settings/bashrc" ] && . "${goboPrefix}/System/Settings/bashrc"
fi

export PYTHONPATH=${goboPrefix}/System/Links/Libraries/python2.3/site-packages:${goboPrefix}/System/Links/Libraries/python2.4/site-packages:$PYTHONPATH

# Without calling cd, prompt does not display ~, but ${HOME}
{ [ `readlink -f ${PWD}` = `readlink -f ${HOME}` ] && cd; } 2> /dev/null
' >> ${goboPrefix}/Programs/Rootless/1.0/bin/StartRootless

# preparing a real_install (which is wrapped by Scripts install)...
if [ ! "`which real_install`" ] 
then
   if [ -e "/bin/install" ]
   then
      ln -sfn /bin/install ${goboPrefix}/Programs/Rootless/1.0/bin/real_install
   elif [ -e "/usr/bin/install" ]
   then
      ln -sfn /usr/bin/install ${goboPrefix}/Programs/Rootless/1.0/bin/real_install
   else 
      i=`which install`
      g=`file "$i" | grep ELF`
      if [ "$g" ]
      then
         ln -sfn "$i" ${goboPrefix}/Programs/Rootless/1.0/bin/real_install
      else
         echo Warning: no CoreUtils install binary was found. Please provide it and link it 
         echo at ${goboPrefix}/Programs/Rootless/1.0/bin/real_install  
      fi
   fi
fi



###############################################################################
# Getting Scripts package and pre-linking it
###############################################################################

if [ ! -e "${goboPrefix}/Programs/Scripts/Current" ]
then 
   if [ -e "/Programs/Scripts/Current" ]
   then
      echo "You are under a GoboLinux system. Copying the Scripts package to your Rootless "
      echo "tree is not required, but its recommended if you want to change some settings."
      echo "Anytime latter you can run 'InstallPackage Scripts' in order to install the "
      echo "latests Scripts version inside Rootless."
      echo "Would you like to copy /Program/Scripts to ${goboPrefix}/Programs/Scripts? [y]es/[N]o"
      read
      if [ "$REPLY" = "y" ]
      then
         scripts=`readlink -f /Programs/Scripts/Current`
         mkdir ${goboPrefix}/Programs/Scripts
         cp -r $scripts ${goboPrefix}/Programs/Scripts
         cd ${goboPrefix}/Programs/Scripts
         ln -s `basename ${scripts}` Current
      fi
   else
      version="${CURRENT_SCRIPTS_VERSION:-2.4.2}"
      scripts=Scripts--${version}--i686.tar.bz2
      wget http://kundor.org/gobo/packages/official/${scripts} -O /tmp/${scripts}
      cd ${goboPrefix}/Programs/
      tar xvfj /tmp/${scripts}
      cd Scripts
      ln -sfn $version Current
      cp -R ${goboPrefix}/Programs/Scripts/$version/Resources/Defaults/Settings ${goboPrefix}/Programs/Scripts/Settings
   fi
fi

function link_directory() {
   from="$1"
   to="$2"
   cd "${to}"
   for entry in ${from}/*; do ln -sfn ${entry} . 2> /dev/null; done
   cd - > /dev/null
}


if [ -e "${goboPrefix}/Programs/Scripts/Current" ]
then
   echo Pre-linking Scripts...
   link_directory ../../Programs/Scripts/Settings       ${goboPrefix}/System/Settings
   link_directory ../../../Programs/Scripts/Current/bin ${goboPrefix}/System/Links/Executables
fi


###############################################################################
# Sourcing GoboPath 
###############################################################################

. ${goboPrefix}/Programs/Rootless/1.0/bin/StartRootless


###############################################################################
# Load all those beautiful shell script libraries we know and love
###############################################################################

echo "Accessing new Rootless environment"
PATH="${PATH}:${goboPrefix}/Programs/Scripts/Current/bin/"
. ScriptFunctions
Import Log
Import GoboLinux
Import Process
Log_Normal "Gobo Rootless i686 has been installed."

# Function to remove things in a pretty way
function rootless_remove() {
   while [ "$1" ]; do
      Log_Normal "Removing $1"
      rm -rf "$1"
      shift
   done
}

# Function to remove all the stuff created by this script
function rootless_uninstall() {
   if Ask "Cancel rootless installation?"; then
      cd "${HOME}"
      rootless_remove "${goboPrograms}" "${goboPrefix}/System" "${goboSettings}"
      [ -e "/Programs/Scripts/Current" ] || rootless_remove "${HOME}/.Settings"
      exit 1
   fi
}

###############################################################################
# Check whether we need to recompile anything
###############################################################################
binaries_ok="no"
if [ "`Get_Architecture`" != i686 ]; then
   Log_Terse "Your machine is `Get_Architecture`."
   if ! Quiet which gcc; then
      Log_Error "gcc isn't installed. Can't recompile"
      binaries_ok="no"
   elif ! Quiet which make; then
      Log_Error "make isn't installed. Can't recompile"
   elif [ -d "${goboPrograms}/Scripts/Current" ]; then
      if Ask "Recompile binaries for your system?"; then
         Quiet pushd "${goboPrograms}/Scripts/Current"
         # Temporarily create a header file to be used as a last resort if the
         # real one doesn't exist on the host system.
         mkdir -p .fakeheaders/linux
         echo -n '
            #ifndef _LINUX_KDEV_T_H
            #define _LINUX_KDEV_T_H
            #define MAJOR(dev)      ((dev)>>8)
            #define MINOR(dev)      ((dev) & 0xff)
            #define MKDEV(ma,mi)    ((ma)<<8 | (mi))
            #endif
         ' >> .fakeheaders/linux/kdev_t.h
         old_include_path="${C_INCLUDE_PATH}"
         location_of_fake_kdev="${goboPrograms}/Scripts/Current/.fakeheaders"
         export C_INCLUDE_PATH="${C_INCLUDE_PATH}:$location_of_fake_kdev"
         make cleanup && make && binaries_ok="yes"
         [ "$binaries_ok" == "yes" ] || Log_Error "Build Failed"
         export C_INCLUDE_PATH="${old_include_path}"
         rm -rf .fakeheaders
         Quiet popd  
      fi
   fi
else
   binaries_ok="yes"
fi

if [ "$binaries_ok" != "yes" ]; then
   Log_Error "Rootless probably won't work here."
   echo -n "Rootless GoboLinux consists mostly of cross-platform shell scripts, but it does
include a couple of binary (compiled) programs. If you're seeing this message,
the versions of those programs currently installed were built for a different
type of computer (an i686 with a GNU Linux kernel).

There is an extremely slim chance that if your kernel has Linux Binary
Compatibility (as do some variants of BSD), everything may work anyway, but
you're probably best off reporting this to the gobolinux-users mailing list,
and removing Rootless for the time being.
"
   rootless_uninstall
fi

###############################################################################
# Packages Linking (Scripts, Rootless)
###############################################################################

if [ -e "${goboPrefix}/Programs/Scripts/Current" ] 
then
   Log_Normal Linking Scripts...
   UpdateSettings Scripts
   SymlinkProgram Scripts
elif [ ! -e "/Programs/Scripts/Current" ]; then
   Log_Error "Installation failed"
   rootless_uninstall
fi

echo
Log_Normal Linking Rootless...
SymlinkProgram Rootless


###############################################################################
# Preparing Rootless startup on next sessions
###############################################################################

for f in .bash_profile .zshrc
do
   file="${HOME}/${f}"
   line=". ${goboPrefix}/Programs/Rootless/Current/bin/StartRootless"
   
   if ! grep "^${line}" ${file} &> /dev/null
   then
      Log_Normal "Adding StartRootless line to ~/${f}"
      echo >> ${file}
      echo "$line" >> ${file}
   fi
done

# Restores the last directory
cd $pwd

Log_Terse "Installation complete."
echo ""
echo "You can now restart your session in order to enjoy GoboLinux Rootless. For"
echo "best results, consider using the zsh shell."
echo ""
echo "Commands recommended to be executed afterwards:"
echo "  InstallPackage Atool"
echo "  InstallPackage Compile"
echo "  Compile Mtail"
echo ""
echo "Please report any problems to gobolinux-users@lists.gobolinux.org"
