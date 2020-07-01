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
$e '#               Sync Sources               # '
$e '#                                          # '
$e '############################################ '
$e
$e "   1 - Sync CM-14.1 (LineageOS 14.1) sources"
$e "   2 - Clone pine device tree"
$e "   3 - Clone pine kernel"
$e "   4 - Clone pine vendor"
$e
$e '############################################ '
$e '#                                          # '
$e '#       APPLY DEVICE SPECIFIC PATCHES      # '
$e '#                                          # '
$e '############################################ '
$e
$e "  5  - Apply pine device tree patches"
$e "  6  - Apply pine kernel patches"
$e "  7  - Apply pine vendor patches"
$e
$e '############################################ '
$e '#                                          # '
$e '#      APPLY/UNINSTALL SOURCE PATCHES      # '
$e '#                                          # '
$e '############################################ '
$e
$e "  8 - Apply CM-14.1 Patches"
$e "  9 - Uninstall CM-14.1 Patches"
$e
$e '############################################ '
$e '#                                          # '
$e '#                BUILDING                  # '
$e '#                                          # '
$e '############################################ '
$e
$e "  10 - Build for pine eng"
$e "  11 - Build for pine user"
$e "  12 - Build for pine userdebug"
$e "  x - Exit"
$e
$e -n "Enter Option: "
read o
	case $o in
        1)  mkdir cm-14.1 && cd cm-14.1 && repo init -u git://github.com/LineageOS/android.git -b cm-14.1 && repo sync;;
        2)  git clone -b lineage-14.1 https://github.com/PineDevelopment/device_sony_pine device/sony/pine;;
        3)  git clone -b 43.0.A.7.106-STOCK https://github.com/PineDevelopment/kernel_sony_pine kernel/sony/pine;;
        4)  git clone -b lineage-14.1 https://github.com/PineDevelopment/vendor_sony_pine vendor/sony/pine;;
        5)  cd device/sony/pine && git am --3way --ignore-space-change --ignore-whitespace < ./1-patches/*.patch && cd ../../..;;
        6)  cd kernel/sony/pine && git am --3way --ignore-space-change --ignore-whitespace < ./1-patches/*.patch && cd ../../..;;
        7)  cd vendor/sony/pine && git am --3way --ignore-space-change --ignore-whitespace < ./1-patches/*.patch && cd ../../..;;
        8)  cd device/sony/pine/patches && chmod a+x *.sh && ./apply_patches.sh && cd ../../../..;;
        9)  cd device/sony/pine/patches && chmod a+x *.sh && ./uninstall.sh && cd ../../../..;;
        10) . build/envsetup.sh && export LC_ALL=C && lunch lineage_pine-eng && brunch lineage_pine-eng;;
        11) . build/envsetup.sh && export LC_ALL=C && lunch lineage_pine-user && brunch lineage_pine-user;;
        12) . build/envsetup.sh && export LC_ALL=C && lunch lineage_pine-userdebug && brunch lineage_pine-userdebug;;
		x) clear; echo; echo "Goodbye."; echo; exit 1;;
		*) ERR_MSG="Invalid option!"; clear;;
	esac
