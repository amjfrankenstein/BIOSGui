#! /bin/bash
googspeak "select bin file to patch"  &

lenfile=$(zenity --file-selection --filename=$HOME/ --width=350 --title="Choose File")
if [ -z "$lenfile" ]
then
    kill $$
else
	googspeak "patching bin file for unlock"  &
autopatcher/autopatch $lenfile | zenity --progress --title="Unlocking bin..." --text="Patching bin..." --width=300 --auto-close --auto-kill --pulsate --time-remaining --percentage=100
fi

s=$lenfile
lennewfile=$(echo "${s%????}_PATCHED${s: -4}")
mv $lennewfile saved/
googspeak "file saved"  &
zenity --height=200 --width=350 --info --text="File Saved to ~/BiosUnlocking/gui/saved/"
