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
$e '#              BUILDING KERNEL             # '
$e '#                                          # '
$e '############################################ '
$e
$e "   1 - Clone Pine kernel"
$e "   2 - Clone gcc toolchain"
$e "   3 - Make KERNEL_OUT folder"
$e "   4 - Build kernel"
$e
$e "  x - Exit"
$e
$e -n "Enter Option: "
read o
	case $o in
        1)  git clone -b 43.0.A.7.106-STOCK https://github.com/PineDevelopment/kernel_sony_pine.git kernel;;
        2)  git clone https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9 -b nougat-release;;
        3)  mkdir KERNEL_OUT;;
        4)  make -C kernel  O=../KERNEL_OUT  ARCH=arm64 CROSS_COMPILE=../aarch64-linux-android-4.9/bin/aarch64-linux-android- pine_defconfig && make O=../KERNEL_OUT/ -C kernel ARCH=arm64  CROSS_COMPILE=../aarch64-linux-android-4.9/bin/aarch64-linux-android- $(nproc --all);;
		x) clear; echo; echo "Goodbye."; echo; exit 1;;
		*) ERR_MSG="Invalid option!"; clear;;
	esac
