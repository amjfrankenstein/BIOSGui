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
googspeak "select file to write"  &
write=$(zenity --file-selection --filename=$HOME/ --width=350 --title="Choose File")

if [ -z "$write" ]
then
    kill $$
else
	googspeak "writing file to chip"  &
    (dpcmd --type $chip -u "$write" -v | tee saved/test.out) | zenity --progress --title="Flashing Chip..." --text="Writing to $chip..." --width=300 --auto-close --auto-kill --pulsate --time-remaining --percentage=100
fi
if grep -q "Verify OK"  saved/test.out; then
     googspeak "write successful"  &
     zenity --height=100 --width=300 --info --text="Sucess!"
else
     googspeak "failed to write"  &
     zenity --height=100 --width=300 --error --text="Failed writing."
fi





