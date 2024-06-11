#!/bin/sh

# Author : Tokumeino 
# V1.0

# Usage : scrape-all-systems <mode> <sourceFolder> <destFolder>
# - <mode> is mandatory : - PULL (download from the net and fill the cache)
#                         - ART  (compose artwok according to XML mix)
#                         - BOTH (both)
# - <sourceFolder> is mandatory ; refers to the ROMs root folder (which contains emulated system folders)
# - <destinationFolder> is optional ; root folder where the scraped media and gamelist will be written
# If <destinationFolder> is not provided, <sourceFolder> is used by default
# Subfolders are created in <destinationFolder>, replicating the ROMs system folders
# The script assumes that there is a <system>.sky empty file in each rom system folder
# <system> refers to skyskraper system names as listed by Skyscraper --help 
# If no <system>.sky, the script skips the folder

# Change to the file/where/you/put/the/mix
#mix="$HOME/mixes/full-gradient-screen-wheel-box.xml"
#mix="$HOME/mixes/full-gradient-screen-wheel.xml"
#mix="$HOME/mixes/inner-gradient-screen-wheel-box.xml"
#mix="$HOME/mixes/inner-gradient-screen-wheel.xml"
mix="$HOME/mixes/simple-box-cart.xml"
#mix="$HOME/mixes/simple-box-flat.xml"
#mix="$HOME/mixes/simple-box.xml"
#mix="$HOME/mixes/full-gradient-top-screen-wheel-box.xml"
#mix="$HOME/mixes/simple-box-shadow.xml"
#mix="$HOME/mixes/simple-box-gradient.xml"

# Put your screenscraper.fr credentials here
credentials="home:pass"

if [ ! -f "$mix" ] ; then
	echo "Mix $mix does not exist. Modify script."
	exit 1
fi

if [ $# -lt 2 ] ; then
    echo "Need 2 parameters : mode then ROMS root folder"
	exit 1
fi

if [ $1 != "PULL" ] && [ $1 != "ART" ] && [ $1 != "BOTH" ] ; then
    echo "First parameter must be PULL or ART"
	exit 1
fi

echo "Ruuning in $1 mode"

if [ ! -d "$2" ] ; then
	echo "ROMS folder $2 (arg2) does not exist"
	exit 1
fi

if [ $# -eq 3 ] && [ ! -d "$3" ] ; then
    echo "Media destination folder $3 does not exist"
	exit 1
fi

srcRoot="$(realpath "$2")"
dstRoot="$srcRoot"

if [ $# -eq 3 ] ; then
	dstRoot="$(realpath "$3")"
fi

echo "Ready to run with SOURCE=$srcRoot and DESTINATION=$dstRoot"
echo "Loop over subfolders"
echo

find "$srcRoot" -mindepth 1 -maxdepth 1 -type d | while read srcFolder; do
	echo "Process $srcFolder"
	
	find "$srcFolder" -mindepth 1 -maxdepth 1 -type f -name "*.sky" | while read skySystemFile ; do
		echo "+ Found $skySystemFile system file"
		skySystem=$(basename "$skySystemFile" .sky)
		echo "- Skyscraper system is $skySystem"
		echo "- Input is $srcFolder"
		dstFolder=$dstRoot/$(basename "$srcFolder") 	# Assumes that the dest system folder
														# has the same name as the source system folder
														# (not suitable for MuOS if fancy system folder names) 
		echo "- Output is $dstFolder"
		
		#### BEFORE COMMANDS FOR ANY MODE ####
		
		if [ $1 = "PULL" ] || [ $1 = "BOTH" ] ; then
			echo "- Pull"
			#### COMMANDS FOR PULL MODE ####
			Skyscraper -p "$skySystem" -i "$srcFolder" -s screenscraper -u "$credentials"
		fi
		if [ $1 = "ART" ] || [ $1 = "BOTH" ] ; then
			echo "- Art"
			##### COMMANDS FOR ART MODE ####
			Skyscraper -p "$skySystem" -i "$srcFolder" -o "$dstFolder" -g "$dstFolder" --verbosity=1 --flags nobrackets,unattend -a "$mix"
		fi
		
		#### AFTER COMMANDS FOR ANY MODE ####

	done
	echo
done
