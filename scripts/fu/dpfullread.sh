#!/bin/bash
googspeak "reading chip type"  &
dpcmd -d > saved/out.out
tail -n3 saved/out.out | head -n1 > saved/out1.out
rm saved/out.out 
cat saved/out1.out | head -n1 | awk '{print $1;}' > saved/chip.out
rm saved/out1.out 
if grep -q Error "saved/chip.out"; then
	googspeak "failed to read chip"  &    
	zenity --height=100 --width=300 --error --text="Failed to read chip"
    kill $$
else
    chip=$(cat saved/chip.out)
fi
googspeak "reading chip first pass"  &
dpcmd --type $chip -r saved/fullread1.bin | zenity --progress --title="First Reading..." --text="Reading chip..." --width=300 --auto-close --auto-kill --pulsate --time-remaining
googspeak "reading chip second pass"  &
dpcmd --type $chip -r saved/fullread2.bin| zenity --progress --title="Second Reading..." --text="Reading chip again..." --width=300 --auto-close --auto-kill --pulsate --time-remaining
zenity --height=100 --width=300 --timeout=2 --info --text="comparing files" &
googspeak "comparing files"  
difference=$(diff saved/fullread1.bin saved/fullread2.bin)
if [ -z "$difference" ]
then
	googspeak "bin files match, successful read"  &    
	zenity --height=100 --width=300 --timeout=2 --info --text="Files Match."
else
	googspeak "bin files do not match"  &
    zenity --height=100 --width=300 --warning --text="Files do not Match."
fi
