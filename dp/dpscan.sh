#!/bin/bash
./googspeak "reading chip type"  &
dpcmd -d |& tee dp/unl/out.out
tail -n3 dp/unl/out.out | head -n1 2>&1 | tee dp/unl/out1.out
rm dp/unl/out.out 
cat dp/unl/out1.out | head -n1 | awk '{print $1;}' 2>&1 | tee dp/unl/chip.out 
rm dp/unl/out1.out  
if grep -q Error "dp/unl/chip.out"; then
	./googspeak "failed to read chip"  &    
	zenity --height=100 --width=300 --error --text="Failed to read chip"
    kill $$
else
    chip=$(cat dp/unl/chip.out)
	zenity --height=100 --width=300 --title="Chip Type is:" --info --text="<big><big>$chip</big></big>"
fi

