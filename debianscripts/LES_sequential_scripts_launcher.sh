##########################################################################
#                    sequential scripts launcher                         #
# made by Brian Peregrine, released under the GNU General Public License #
##########################################################################

# type "touch LES_sequential_scripts_launcher.sh" in the terminal, followed by
# "chmod+x LES_sequential_scripts_launcher.sh" to make this script executable
# then, type "./LES_sequential_scripts_launcher.sh" to execute the script

#!/bin/sh

# Making the other scripts in the folder automatically executable, and executing them
touch LES_install_crunchbangOpenbox_andConky.sh LES_Linuxdirectorytree_changing.sh LES_slitaz_altering_programs.sh LES_internet_speed_increase_A LES_internet_speed_increase_B LES_internet_speed_increase_C LES_bootmenu_changing.sh LES_BusyBox_cmd_update.sh 

chmod+x LES_install_crunchbangOpenbox_andConky.sh LES_Linuxdirectorytree_changing.sh LES_slitaz_altering_programs.sh LES_internet_speed_increase_A LES_internet_speed_increase_B LES_internet_speed_increase_C LES_bootmenu_changing.sh LES_BusyBox_cmd_update.sh

./LES_install_crunchbangOpenbox_andConky.sh
./LES_Linuxdirectorytree_changing.sh
./LES_slitaz_altering_programs.sh
./LES_internet_speed_increase_A
./LES_internet_speed_increase_B
./LES_internet_speed_increase_C
./LES_bootmenu_changing.sh
./LES_BusyBox_cmd_update.sh
