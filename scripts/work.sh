#!/bin/bash
# ------------------------------------------------------
# work.sh - Log some work activity
# ------------------------------------------------------

# Format is that there is a new file for each month. 
# Each new day entry adds some header information about
# today's agenda, and then entries are appended under that
# Date
# @HHMM {tab} [thing that I Did]

# ALL the arguments
str="$*"
echo "Adding Activity to log..." | lolcat

logpath=$JOURNAL_DIR/
#echo $logpath

timestamp=$(date +%H%M)
echo $timestamp 

# Does a file exist for the Year / Month?
# File Format is... 
# YEAR-MONTH.md
filename=$(date +%Y-%B).md
echo $filename

fullpath=$logpath$filename
echo $fullpath

workentry=$(printf "@%-1s - %s\n" "$timestamp" "$str")
#workentry=${workentry}
echo $workentry

todaytitle="## $(date +%Y-%m-%d) $(date +%A)" 
echo $todaytitle

#
# Create a new file (if required)
#
if [ ! -f $fullpath ]; then
	# Create a new file for today
	touch $fullpath
	
	echo "- Creating new journal file at $fullpath" | lolcat
	
	echo "# $(date +%B) $(date +%Y) Journal" >> $fullpath
	echo "" >> $fullpath
	# echo "*** $(date +%d-%m-%Y) ACTIVITY LOG ***" >> $fullpath
	# echo "============================================================" >> $fullpath
	# echo "" >> $fullpath
	# echo "*** Schedule for Today $(date '+%A, %B %d %Y') ***" >> $fullpath
	# echo "------------------------------------------------------------" >> $fullpath
	# icalbuddy -n -eep notes,attendees,location -ps "|, |" -b "- " -npn  -po datetime,title  eventsToday >> $fullpath
	
	# echo "- Today's Schedule added..." | lolcat
	
	# echo "" >> $fullpath
	# echo "*** Task List ***" >> $fullpath
	# echo "------------------------------------------------------------" >> $fullpath
	# reminders show tasks >> $fullpath
	
	# echo "- Task List added..." | lolcat
	
	# echo "" >> $fullpath
	# echo "*** Activity ***" >> $fullpath	
	# echo "------------------------------------------------------------" >> $fullpath	
	
    echo "- New Log Successfully Created. " | lolcat
fi

if grep -q "$todaytitle" $fullpath; then
	#echo "$todaytitle found"
	true
else
	# echo "$todaytitle NOT found "
	echo "" >> $fullpath
	echo "## $todaytitle" >> $fullpath

	# Add in today's agenda
	echo "" >> $fullpath
	echo "### Today " >> $fullpath
	icalbuddy -n -eep notes,attendees,location -ps "|, |" -b "* " -npn  -po datetime,title  eventsToday >> $fullpath
	echo "" >> $fullpath
	echo "### Activities" >> $fullpath

	echo "- Today's Schedule added..." | lolcat

fi

printf "%s\n" "$workentry" >> $fullpath	
echo "- Added $workentry" | lolcat
echo "- DONE! " | lolcat