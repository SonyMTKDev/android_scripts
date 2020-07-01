#!/bin/bash
#
# Copyright (C) 2017 Pablo Fraile Alonso (Github aka: Pablito2020)
# By pablito2020 and modified by jmpfbmx
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>

# Variables
e=echo

# Echo lines
$e "Select what do you want to do:"
$e
$e '############################################ '
$e '#                                          # '
$e '#     INSTALL ADB AND FASTBOOT PACKAGES    # '
$e '#                                          # '
$e '############################################ '
$e
$e "   1 - Install ADB"
$e "   2 - Install FASTBOOT"
$e "   3 - Install udev-rules"
$e
$e '############################################ '
$e '#                                          # '
$e '#               SYSTEM TOOLS               # '
$e '#                                          # '
$e '############################################ '
$e
$e "  4 - ADB logcat (Showing everything)"
$e "  5 - ADB logcat showing only  showing warning, error and fatal mesasges"
$e "  6 - ADB logcat showing only showing error and fatal messages"
$e "  7 - ADB logcat only showing fatal messages"
$e "  8 - Debug everything and save it to a file called adb_debug.txt"
$e "  9 - Debug warning, error and fatal mesasges and save it to a file called adb_warning.txt"
$e "  10 - Debug error and fatal messages and save it to a file called adb_error.txt"
$e "  11 - Debug only fatal messages and save it to a file called adb_fatal.txt"
$e
$e '############################################ '
$e '#                                          # '
$e '#               KERNEL TOOLS               # '
$e '#                                          # '
$e '############################################ '
$e
$e "  12 - ADB shell dmesg"
$e "  13 - Make an adb shell dmesg and save it to a file called dmesg.txt"
$e "  14 - Pull the last_kmsg file"
$e
$e '############################################ '
$e '#                                          # '
$e '#               BASIC TOOLS                # '
$e '#                                          # '
$e '############################################ '
$e
$e "  15 - reboot system"
$e "  16 - reboot recovery"
$e "  17 - reboot fastboot (I recomend to use this command only if you have a qcomn device)"
$e "  18 - Check if your device is succesfully connected via adb"
$e "  19 - Make an adb shell"
$e "  x - Exit"
$e
$e -n "Enter Option: "
read o
	case $o in
        1)  sudo apt-get install adb android-tools-adb android-tools-adbd;;
        2)  sudo apt-get install android-tools-fastboot fastboot;;
        3)  git clone http://github.com/invisiblek/udevrules.git && cd udevrules && ./install.sh;;
		4) adb logcat;;
		5) adb logcat *:W;;
		6) adb logcat *:E;;
		7) adb logcat *:F;;
		8) adb logcat > adb_debug.txt;;
		9) adb logcat *:W > adb_warning.txt;;
	   10) adb logcat *:E > adb_error.txt;;
	   11) adb logcat *:F > adb_fatal.txt;;
       12) adb shell dmesg;;
       13) adb shell dmesg > dmesg.txt;;
       14) adb pull proc/last_kmsg2;;
       15) adb reboot;;
       16) adb reboot recovery;;
       17) adb reboot-bootloader;;
       18) adb devices;;
       19) adb shell;;
		x) clear; echo; echo "Goodbye."; echo; exit 1;;
		*) ERR_MSG="Invalid option!"; clear;;
	esac
