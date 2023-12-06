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
	zenity --height=100 --width=300 --title="Chip Type is:" --info --text="<big><big>$chip</big></big>"
fi

