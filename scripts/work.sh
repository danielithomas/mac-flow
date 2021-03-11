#!/bin/bash
# ------------------------------------------------------
# work.sh - Log some work activity
# ------------------------------------------------------

# Format is that there is a new file for each month. 
# Each new day entry adds some header information about
# today's agenda, and then entries are appended under that
# Date
# @HHMM - [thing that I Did]

# ALL the arguments
# (yes, not quoting here...)
str="$*" 
echo "Adding Activity to log..." | lolcat

logpath=$JOURNAL_DIR/
#echo $logpath

timestamp=$(date +%H%M)
# echo $timestamp 
yesterday=$(date -v -1d '+%Y-%m-%d')

# Does a file exist for the Year / Month?
# File Format is... 
# YEAR-MONTH.md
filename=$(date +%Y-%B).md
# echo $filename

fullpath=$logpath$filename
# echo $fullpath

workentry=$(printf "**@%-1s** - %s\n" "$timestamp" "$str")
#workentry=${workentry}
# echo $workentry

todaytitle="## $(date +%Y-%m-%d) $(date +%A)" 
# echo $todaytitle

#
# Create a new file (if required)
#
if [ ! -f $fullpath ]; then
	# Create a new file for today
	touch $fullpath
	
	echo "- Creating new journal file at $fullpath" | lolcat
	
	echo "# $(date +%B) $(date +%Y) Journal" >> $fullpath
	echo "" >> $fullpath
	
    echo "- New Log Successfully Created. " | lolcat
fi

if grep -q "$todaytitle" $fullpath; then
	#echo "$todaytitle found"
	true
else
	# echo "$todaytitle NOT found "
	echo "" >> $fullpath
	echo "$todaytitle" >> $fullpath

	# Add in today's agenda
	echo "" >> $fullpath

	if command -v m365 &> /dev/null
	then
		echo "### Tasks Completed Yesterday" >> $fullpath
		sh $MAC_FLOW/get-tasks-completed-by-date.sh "Tasks" "$yesterday" >> $fullpath
		echo "" >> $fullpath
		echo "- Added tasks completed yesterday" | lolcat
	fi

	if command -v m365 &> /dev/null
	then
		echo "### Flagged Emails" >> $fullpath
		sh $MAC_FLOW/get-flagged-emails.sh >> $fullpath
		#echo "" >> $fullpath
		echo "- Added flagged emails" | lolcat
	fi

	echo "### Today's Agenda " >> $fullpath
	icalbuddy -n -eep notes,attendees,location -ps "|, |" -b " ⏰ " -npn  -po datetime,title  eventsToday >> $fullpath
	echo "" >> $fullpath

	if command -v m365 &> /dev/null
	then
		echo "### Current Tasks" >> $fullpath
		sh $MAC_FLOW/get-tasks.sh "Tasks" >> $fullpath
		#echo "" >> $fullpath
		echo "- Added current tasks" | lolcat
	fi

	echo "### Activities" >> $fullpath
	#echo "" >> $fullpath
	echo "- Today's Schedule added..." | lolcat

fi

# TODO: Todos! :D	
# echo "" >> $fullpath
# echo "*** Task List ***" >> $fullpath
# echo "------------------------------------------------------------" >> $fullpath
# reminders show tasks >> $fullpath
# echo "- Task List added..." | lolcat

printf "%s\n" "$workentry" >> $fullpath	
echo "- Added $workentry" | lolcat
echo "- DONE! " | lolcat