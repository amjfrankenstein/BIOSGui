#!/bin/bash
scripts/fu/dpfullread.sh
googspeak "unlocking bin file"  &
BOX86_NOBANNER=1 wine 'autopatcher/HPUnlocker.exe' scripts/fullread1.bin  | zenity --progress --title="Unlocking Bin..." --text="Patching Bin File..." --width=300 --auto-close --auto-kill --pulsate --time-remaining --percentage=100

if [ -f "scripts/fullread1_unlocked.bin" ]; then
	googspeak "bin file patched"  &
    zenity --height=200 --width=350 --timeout=3 --info --text="Bin File Patched.."
	chip=$(cat scripts/chip.out)
	googspeak "writing patched file to chip"  &
	dpcmd --type $chip -u scripts/fullread1_unlocked.bin -v | zenity --progress --title="Flashing Chip..." --text="Writing to chip..." --width=300 --auto-close --auto-kill --pulsate --time-remaining --percentage=100
	googspeak "unlock complete"  &
	zenity --height=100 --width=300 --info --text="<big>Unlock is complete!</big>" --no-wrap
else 
	googspeak "file patching failed"  &
    zenity --height=100 --width=300 --info --text="Bin File Patch Failed"
    kill $$
fi




