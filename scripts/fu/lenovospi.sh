#!/bin/bash

scripts/fu/spifullread.sh
googspeak "patching bin file for unlock"  &
autopatcher/autopatch scripts/fullread1.bin | zenity --progress --title="Unlocking bin..." --text="Patching bin..." --width=300 --auto-close --auto-kill --pulsate --time-remaining --percentage=100

if [ -f "scripts/fullread1_PATCHED.bin" ]; then
	googspeak "file patch succeeded"  &
    zenity --height=200 --width=350 --timeout=3 --info --text="Bin File Patched.."
	chip=$(cat scripts/chip2.out)
	googspeak "writing unlock to chip"  &
	flashrom -p linux_spi:dev=/dev/spidev0.0,spispeed=12000 -c $chip -w scripts/fullread1_PATCHED.bin | zenity --progress --title="Flashing Chip..." --text="Writing to chip..." --width=300 --auto-close --auto-kill --pulsate --time-remaining --percentage=100
	googspeak "complete in system portion then click OK"  &
	zenity --height=100 --width=300 --info --text="Press OK after in system portion" --no-wrap
	googspeak "restoring original bi-aws"  &
	flashrom -p linux_spi:dev=/dev/spidev0.0,spispeed=12000 -c $chip -w scripts/fullread1.bin | zenity --progress --title="Flashing Chip..." --text="Writing original bin to chip..." --width=400 --auto-close --auto-kill --pulsate --time-remaining
	googspeak "success"  &
    zenity --height=100 --width=300 --info --text="Success!"
else 
	googspeak "file patch failed"  &
    zenity --height=100 --width=300 --info --text="Bin File Patch Failed"
    kill $$
fi







