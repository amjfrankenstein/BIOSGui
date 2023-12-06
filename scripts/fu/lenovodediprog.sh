#!/bin/bash
scripts/fu/dpfullread.sh
googspeak "patching file for unlock"  &
autopatcher/autopatch scripts/fullread1.bin | zenity --progress --title="Unlocking bin File..." --text="Patching Bin..." --width=300 --auto-close --auto-kill --pulsate --time-remaining --percentage=100

if [ -f "scripts/fullread1_PATCHED.bin" ]; then
	googspeak "file patched successfully"  &
    zenity --height=100 --width=300 --timeout=3 --info --text="Bin File Patched.."
	chip=$(cat scripts/chip.out)
	googspeak "writing patched bin to chip"  &
	dpcmd --type $chip -u scripts/fullread1_PATCHED.bin -v | zenity --progress --title="Patching Chip..." --text="Patching $chip..." --width=300 --auto-close --auto-kill --pulsate --time-remaining --percentage=100
	googspeak "patch loaded successfully, complete in system portion then click OK"  &
	zenity --height=100 --width=300 --info --text="<big>Unlock is loaded. Press OK when ready for phase two.</big>" --no-wrap
	googspeak "restoring bi-aws back to original"  &
	dpcmd --type $chip -u scripts/fullread1.bin -v | zenity --progress --title="Flashing Chip..." --text="Writing original bin to $chip..." --width=300 --auto-close --auto-kill --pulsate --time-remaining --percentage=100

	googspeak "system is unlocked"  &
	zenity --height=100 --width=300 --info --text="<big>Unlock is complete!</big>" --no-wrap
else 
	googspeak "patch failed to apply"  &
    zenity --height=100 --width=300 --info --text="Bin File Patch Failed"
	kill $$
fi


