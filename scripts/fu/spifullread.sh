#!/bin/bash
googspeak "reading chip type" &
scripts/fu/getchip.sh
scripts/fu/editchip1.sh
scripts/fu/editchip2.sh
if [ -s scripts/chip2.out ]; then
    chip=$(cat scripts/chip2.out)
else
	googspeak "failed to read chip"  &
    zenity --height=200 --width=350 --error --text="Failed to read chip"
    kill $$
fi
googspeak "reading chip first pass"  &
flashrom -p linux_spi:dev=/dev/spidev0.0,spispeed=12000 -c $chip  -r scripts/fullread1.bin | zenity --progress --title="First Reading..." --text="Reading chip..." --width=350 --auto-close --auto-kill --pulsate --time-remaining
googspeak "reading chip second pass"  &
flashrom -p linux_spi:dev=/dev/spidev0.0,spispeed=12000 -c $chip  -r scripts/fullread2.bin | zenity --progress --title="Second Reading..." --text="Reading chip again..." --width=350 --auto-close --auto-kill --pulsate --time-remaining
difference=$(diff scripts/fullread1.bin scripts/fullread2.bin)
if [ -z "$difference" ]
then
	googspeak "files match"  &    
	zenity --height=200 --width=350 --timeout=2 --info --text="Files Match."
else
	googspeak "files do not match"  &
    zenity --height=200 --width=350 --warning --text="Files do not Match."
	kill $$
fi

