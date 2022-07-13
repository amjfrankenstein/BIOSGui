#!/bin/bash
./googspeak "clear saved data?"  &
zenity --question --width=300
case $? in
	0)rm -r dp/unl/* 
	  rm -r ls/unl/* 
	  rm -r fu/unl/* 
	  rm -r tools/unl/* 
	  ./googspeak "data reset"  &
 	  zenity --height=200 --width=350 --title="Delete" --info --text="All Created Files Deleted" 
	;;
	1) $1
	;;
	*) $1
	;;
esac

