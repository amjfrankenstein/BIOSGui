#!/bin/bash
googspeak "reading chip type"  
./ls/getchip.sh
./ls/editchip1.sh
./ls/editchip2.sh
if [ -s ls/unl/chip2.out ]; then
    chip=$(cat ls/unl/chip2.out)
else
	googspeak "chip not visible"  &
	zenity --height=100 --width=300 --timeout=3 --error --text="Failed to read chip"
    kill $$
fi
googspeak "confirm to erase chip"  &
zenity --question

case $? in
	0) googspeak "erasing chip"  &
	   flashrom -p linux_spi:dev=/dev/spidev0.0,spispeed=12000 -c $chip -E -VVV > /dev/pts/0 | zenity --progress --title="Chip erasing..." --text="Erasing "$chip"..." --width=300 --auto-close --auto-kill --pulsate --time-remaining
	case $? in
		0) 
		;;
		1) kill $$
		;;
		*) kill $$
		;;
	esac
	googspeak "erased"  &
	zenity --height=100 --width=300 --info --text="$chip Erased"
	;;
	1) $1
	;;
	*) $1
	;;
esac


