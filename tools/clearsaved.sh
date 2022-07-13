#!/bin/bash
./googspeak "empty saved folder?"  &
zenity --question --width=300
case $? in
	0)rm -r saved/* 
	  ./googspeak "cleared"  &
	  zenity --height=200 --width=350 --title="Delete" --info --text="All Created Files Deleted" 
	;;
	1) $1
	;;
	*) $1
	;;
esac
