#!/bin/bash
googspeak "reading chip type"  &
ls/getchip.sh
ls/editchip1.sh
ls/editchip2.sh
chip=$(cat ls/unl/chip2.out)
zenity --height=200 --width=350 --title="Chip Type is:" --info --text=$chip
