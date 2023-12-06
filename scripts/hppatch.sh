#! /bin/bash
googspeak "choose file to patch"  &
hpfile1=$(zenity --file-selection --filename=$HOME/)
case $? in
	0) hpfile=$(echo $hpfile1 | sed 's/|//')
	   BOX86_NOBANNER=1 wine autopatcher/HPUnlocker.exe $hpfile | zenity --progress --title="Unlocking file..." --text="Patching bin file..." --width=350 --auto-close --auto-kill --pulsate --time-remaining --percentage=100
	   s=$hpfile
	   hpnewfile=$(echo "${s%????}_unlocked${s: -4}")
	   mv $hpnewfile saved/
	   if [ -z "saved/*_unlocked.bin" ]; then
  		  zenity --height=200 --width=350 --info --text="Bin File Patch Failed"
	      kill $$
	   else 
          zenity --height=200 --width=350 --timeout=2 --info --text="Bin File Patch Succeded"
          zenity --height=200 --width=350 --info --text="File Saved to ~/BIOSGui/saved/"
       fi
	;;
	1) kill $$
	;;
	*) $1
	;;
esac



