#!/bin/bash
googspeak "select bin file to clean"  &
zenity --file-selection --filename=$HOME/ --width=350 --title="Clean Intel ME" --text="Choose binfile to clean." > tools/unl/filetome.out
case $? in
	0)write=$(cat tools/unl/filetome.out | sed 's/|//') 
	  me_cleaner.py -O saved/melargeS.bin -S "$write" | tee saved/melarges.out
	  me_cleaner.py -O saved/mesmalls.bin -s "$write" | tee saved/mesmalls.out
 	  googspeak "bin files created"  &
	  yad --height=250 --width=375 --title="Clean Intel ME" --text="`printf "<big>Files created @</big> \n<small><small>$HOME/BIOSGui/saved/me*.bin</small></small> \n \nmelarges.bin is ME removal \n<big>(may not boot)</big> \n \nmesmalls.bin is ME bit off."`" --center
	;;
	1) $1
	;;
	*) $1
	;;
esac

