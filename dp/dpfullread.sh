#!/bin/bash
./googspeak "reading chip type"  &
dpcmd -d 2>&1 | tee dp/unl/out.out
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
fi
./googspeak "reading chip first pass"  &
dpcmd --type $chip -r dp/unl/fullread1.bin | zenity --progress --title="First Reading..." --text="Reading chip..." --width=300 --auto-close --auto-kill --pulsate --time-remaining
./googspeak "reading chip second pass"  &
dpcmd --type $chip -r dp/unl/fullread2.bin| zenity --progress --title="Second Reading..." --text="Reading chip again..." --width=300 --auto-close --auto-kill --pulsate --time-remaining
zenity --height=100 --width=300 --timeout=2 --info --text="comparing files" &
./googspeak "comparing files"  
difference=$(diff dp/unl/fullread1.bin dp/unl/fullread2.bin)
if [ -z "$difference" ]
then
	./googspeak "bin files match, successful read"  &    
	zenity --height=100 --width=300 --info --text="Files Match."
else
	./googspeak "bin files do not match"  &
    zenity --height=100 --width=300 --warning --text="Files do not Match."
fi
