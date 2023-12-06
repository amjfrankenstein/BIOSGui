#!/bin/bash
googspeak "clear created files?"  &
zenity --question --width=300
case $? in
	0)rm -r saved/* 
	  googspeak "files removed" &
	  zenity --height=200 --width=350 --title="Delete" --info --text="All created Files Deleted" 
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

