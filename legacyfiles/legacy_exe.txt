#!/bin/bash
unbuffer dpcmd -d |& tee -a output.txt
if grep -q Error output.txt; then
    espeak -p 9 -s 190 'chip type unknown'
else
    espeak -p 9 -s 190 'chip type confirmed'
fi
rm output.txt
echo "Press any key to continue" 
while [ true ] ; do
read -t 10 -n 1 
if [ $? = 0 ] ; then 
exit ; 
else 
echo 'goodbye'
exit 
fi 
done
