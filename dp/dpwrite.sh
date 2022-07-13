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
./googspeak "select file to write"  &
write=$(zenity --file-selection --filename=$HOME/ --width=350 --title="Choose File")

if [ -z "$write" ]
then
    kill $$
else
	./googspeak "writing file to chip"  &
    (dpcmd --type $chip -u "$write" -v | tee dp/unl/test.out) | zenity --progress --title="Flashing Chip..." --text="Writing to $chip..." --width=300 --auto-close --auto-kill --pulsate --time-remaining --percentage=100
fi
if grep -q Error  dp/unl/test.out; then
     ./googspeak "failed to write"  &
     zenity --height=100 --width=300 --error --text="Failed writing."
else
     ./googspeak "write successful"  &
	 zenity --height=100 --width=300 --info --text="Sucess!"
fi





