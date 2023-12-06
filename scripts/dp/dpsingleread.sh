#!/bin/bash
googspeak "reading chip type"  &
dpcmd -d |& tee saved/out.out
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

filename=$(yad --entry --width=300 --center)

if [ -z "$filename" ]
then
	zenity --height=100 --width=300 --error --text="Nothing Selected"
    kill $$
else
	googspeak "saving chip to file $filename"  &
    dpcmd --type $chip -r 'saved/'$filename | zenity --progress --title="Reading..." --text="Reading chip..." --width=300 --auto-close --auto-kill --pulsate --time-remaining
	googspeak "file saved"  &
	zenity --height=100 --width=300 --info --text=$filename' Saved.'
fi


