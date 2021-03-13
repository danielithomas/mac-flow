#!/bin/bash

fullpath="$1"

# Mac implementation of date. 
prevdate=$(date -v -1d '+%Y-%m-%d')
dayname="$(date +%A)"
todaytitle="## $(date +%Y-%m-%d) $(date +%A)" 

if grep -q "$todaytitle" $fullpath; then

    #
    # We have a journal entry for today. Nothing to do.
    #
	true

else
	#
    # We don't have a journal entry for today. In this case, we are going to
    # add one, then we'll show tasks we completed, flagged emails, our agenda
    # for the day and any outstanding tasks
    #

	echo "" >> $fullpath
	echo "$todaytitle" >> $fullpath

	# Add in today's agenda
	echo "" >> $fullpath

    #
    # Will only try and add tasks and flagged emails if Microsoft 365 is 
    # installed, otherwise it will skip it.
    #
	if command -v m365 &> /dev/null
	then
        
        #
        # Tasks completed: Let's be a bit clever. If it's Monday, grab the 
        # tasks completed from Friday.
        #
        if [[ "$dayname" == "Monday" ]]; then
            prevdate=$(date -v -3d '+%Y-%m-%d')
            echo "Happy Monday! Let's add tasks completed Friday" | lolcat
            echo "### Tasks Completed Friday" >> $fullpath
        else
            echo "### Tasks Completed Yesterday" >> $fullpath
        fi
		
		sh $MAC_FLOW/tasks/tasks-list-completed-date.sh "Tasks" "$prevdate" >> $fullpath
		echo "- Added tasks completed" | lolcat

        #
        # Flagged emails. This is a nifty feature of Microsoft365: Flagged
        # emails can be listed as "tasks" in Microsoft Todo. 
        #
		echo "### Flagged Emails" >> $fullpath
		sh $MAC_FLOW/tasks/tasks-list-flagged-emails.sh >> $fullpath
		echo "- Added flagged emails" | lolcat
	fi

    #
    # Calendar - What's on today.
    #
	echo "### Today's Agenda " >> $fullpath
	icalbuddy -n -eep notes,attendees,location -ps "|, |" -b " ⏰ " -npn  -po datetime,title  eventsToday >> $fullpath
	echo "" >> $fullpath

    #
    # Current tasks 
    #
	if command -v m365 &> /dev/null
	then
		echo "### Current Tasks" >> $fullpath
		sh $MAC_FLOW/tasks/tasks-list-active.sh "Tasks" >> $fullpath
		echo "- Added current tasks" | lolcat
	fi

	echo "### Activities" >> $fullpath
	echo "- Today's Schedule added..." | lolcat

fi
