#!/bin/bash
./googspeak "clear created files?"  &
zenity --question --width=300
case $? in
	0)rm -r dp/unl/* 
	  rm -r ls/unl/* 
	  rm -r fu/unl/* 
	  rm -r tools/unl/* 
	  ./googspeak "files removed" &
	  zenity --height=200 --width=350 --title="Delete" --info --text="All created Files Deleted" 
	  ./googspeak "clear saved folder?" &
 	  zenity --question --width=300
	case $? in
		0)rm -r saved/*
		  ./googspeak "files removed" &
		  zenity --height=200 --width=350 --title="Delete" --info --text="All saved Files Deleted" 
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

