#!/bin/bash
googspeak "reading chip type"  &
dpcmd -d 2>&1 | tee saved/out.out
tail -n3 saved/out.out | head -n1 2>&1 | tee saved/out1.out
rm saved/out.out 
cat saved/out1.out | head -n1 | awk '{print $1;}' 2>&1 | tee saved/chip.out
rm saved/out1.out 
if grep -q Error "saved/chip.out"; then
	googspeak "failed to read chip"  &    
	zenity --height=100 --width=300 --error --text="Failed to read chip"
    kill $$
else
    chip=$(cat saved/chip.out)
fi
googspeak "confirm to erase chip"  &
zenity --question --width=300 
case $? in
	0)googspeak "erasing"  &
	  dpcmd --type $chip -e | zenity --progress --title="Chip erasing..." --text="Erasing "$chip"..." --width=300 --auto-close --auto-kill --pulsate --time-remaining
	googspeak "chip erasure complete"  &
	zenity --height=100 --width=300 --info --text="$chip Erased"
	;;
	1) kill $$
	;;
	*) $1
	;;
esac


