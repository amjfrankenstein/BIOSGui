#!/bin/bash
./googspeak "reading chip type"  &
dpcmd -d > fu/unl/out.out
tail -n3 fu/unl/out.out | head -n1 > fu/unl/out1.out
rm fu/unl/out.out 
cat fu/unl/out1.out | head -n1 | awk '{print $1;}' > fu/unl/chip.out
rm fu/unl/out1.out 
if grep -q Error "fu/unl/chip.out"; then
	./googspeak "failed to read chip"  &    
	zenity --height=100 --width=300 --error --text="Failed to read chip"
    kill $$
else
    chip=$(cat fu/unl/chip.out)
fi
./googspeak "reading chip first pass"  &
dpcmd --type $chip -r fu/unl/fullread1.bin | zenity --progress --title="First Reading..." --text="Reading chip..." --width=300 --auto-close --auto-kill --pulsate --time-remaining
./googspeak "reading chip second pass"  &
dpcmd --type $chip -r fu/unl/fullread2.bin| zenity --progress --title="Second Reading..." --text="Reading chip again..." --width=300 --auto-close --auto-kill --pulsate --time-remaining
zenity --height=100 --width=300 --timeout=2 --info --text="comparing files" &
./googspeak "comparing files"  
difference=$(diff fu/unl/fullread1.bin fu/unl/fullread2.bin)
if [ -z "$difference" ]
then
	./googspeak "bin files match, successful read"  &    
	zenity --height=100 --width=300 --timeout=2 --info --text="Files Match."
else
	./googspeak "bin files do not match"  &
    zenity --height=100 --width=300 --warning --text="Files do not Match."
fi
