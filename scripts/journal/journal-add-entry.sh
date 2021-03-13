#!/bin/bash

workentry="$1"
fullpath="$2"

#
# Record the journal entry
#
printf "%s\n" "$workentry" >> $fullpath	
echo "- Added to journal: $workentry " | lolcat