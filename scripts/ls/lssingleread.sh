#!/bin/bash
googspeak "reading chip type" &
./ls/getchip.sh
./ls/editchip1.sh
./ls/editchip2.sh
chip=$(cat ls/unl/chip2.out)
googspeak "choose filename"  &
filename=$(yad --entry --title="Name File" --text="Choose file name." --width=300 --center)
case $? in
	0) googspeak "writing chip data to $filename"  &
	   flashrom -p linux_spi:dev=/dev/spidev0.0,spispeed=12000 -c $chip -r 'ls/unl/'$filename | zenity --progress --title="Reading Chip..." --text="Reading $chip..." --width=300 --auto-close --auto-kill --pulsate --time-remaining --percentage=100
	case $? in
		0) 
		;;
		1) kill $$ && $1
		;;
		*) kill $$ && $1
		;;
	esac
		googspeak "bin file saved"  &
	   	zenity --height=100 --width=300 --info --text=$filename" Saved."
	;;
	1) $1
	;;
	*) $1
	;;
esac
