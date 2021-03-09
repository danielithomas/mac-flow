#!/bin/bash
# ------------------------------------------------------
# today-cal.sh - today's Calendar
# ------------------------------------------------------

echo
echo "*** Today's Schedule for $(date '+%A, %B %d %Y') ***" | lolcat
echo "------------------------------------------------------" | lolcat
icalbuddy -n -eep notes,attendees,location -ps "|, |" -b ">   " -npn  -po datetime,title  eventsToday | lolcat 
echo "------------------------------------------------------" | lolcat
echo
