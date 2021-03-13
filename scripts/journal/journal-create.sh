#!/bin/bash

fullpath="$1"

#
# Create a new file (if required).
# Does a file exist in the format Year-Month.md?
#
if [ ! -f $fullpath ]; then
	# Create a new file for today
	touch $fullpath
	
	echo "- Creating new journal file at $fullpath" | lolcat
	
	echo "# $(date +%B) $(date +%Y) Journal" >> $fullpath
	
    echo "- New journal successfully created. " | lolcat
fi

