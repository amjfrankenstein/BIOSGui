#!/bin/bash
googspeak "choose first file"  &
file1=$(zenity --file-selection --filename=$HOME/ --width=350 --title="Choose first file")
case $? in
	0)googspeak "choose file 2"  & 
	  file2=$(zenity --file-selection --filename=$HOME/ --width=350 --title="Choose Second file")
		case $? in
			0) 
			   difference=$(diff $file1 $file2)
		 	   if [ -z "$difference" ]
			   then
					googspeak "files match"  &    				
					zenity --width=300 --height=100 --info --text="Files Match."
			   else
					googspeak "files do not match"  &
    				zenity --width=300 --height=100 --warning --text="Files do not Match."			
			   fi
			;;
			1) $1
			;;
			*) $1
			;;
		esac
	;;
	1) $1
	;;
	*) $1
	;;
esac
