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
$e '#            WORKING WITH BLOBS            # '
$e '#                                          # '
$e '############################################ '
$e
$e "   1 - Clone Pine device tree"
$e "   2 - Set the correct attributes"
$e "   3 - Execute extract-files.sh"
$e "   4 - Execute setup-makefiles.sh"
$e
$e "  x - Exit"
$e
$e -n "Enter Option: "
read o
	case $o in
        1)  git clone -b lineage-14.1 https://github.com/PineDevelopment/device_sony_pine.git device/sony/pine && cd device/sony/pine;;
        2)  chmod a+x *.sh;;
        3)  ./extract-files.sh;;
        4)  ./setup-makefiles.sh;;
		x) clear; echo; echo "Goodbye."; echo; exit 1;;
		*) ERR_MSG="Invalid option!"; clear;;
	esac
