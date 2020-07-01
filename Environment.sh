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
$e '# INSTALL PACKAGES NEEDED FOR ROM BUILDING # '
$e '#                                          # '
$e '############################################ '
$e
$e "   1 - Install platform tools"
$e "   2 - Install repo"
$e "   3 - Install git"
$e "   4 - Install openjdk"
$e "   5 - Install the needed packages"
$e
$e "  x - Exit"
$e
$e -n "Enter Option: "
read o
	case $o in
        1)  wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip && unzip platform-tools-latest-linux.zip -d ~ && echo "You need to open as root ~/.profile and add at the end of the file this:"
echo "# add Android SDK platform tools to path
if [ -d "$HOME/platform-tools" ] ; then
    PATH="$HOME/platform-tools:$PATH"
fi";;
        2)  curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo && chmod a+x ~/bin/repo && echo "You need to open as root ~/.profile and add at the end of the file this:"
echo "# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi" && sudo apt-get install repo;;
        3)  sudo apt-get install git;;
        4)  sudo apt-get install openjdk-8-jdk;;
        5)  sudo apt-get install bc bison build-essential ccache curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5 libncurses5-dev libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev;;
		x) clear; echo; echo "Goodbye."; echo; exit 1;;
		*) ERR_MSG="Invalid option!"; clear;;
	esac
