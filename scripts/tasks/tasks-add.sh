#!/bin/bash


# Build the full path of the journal file
# File Format is... 
# YEAR-MONTH.md
filename=$(date +%Y-%B).md
logpath=$JOURNAL_DIR/
fullpath=$logpath$filename

tasktype="$1"
tasklist="$2"
str="'${@:3}'"

description="$(sed -e "s/^'//" -e "s/'$//" <<< $str)"

#
# Fun icon - used for quick visual scanning when looking at the journal.
#
funicon="🍀"
taskname="Task"

case "$tasktype" in
'action')
funicon="⭐️"
taskname="Action"
;;

'idea')
funicon="💡"
taskname="Idea"
;;

'parked')
funicon="📌"
taskname="Park"
;;
esac

#
# Create a new file (if required)
#
sh $MAC_FLOW/journal/journal-create.sh "$fullpath"

#
# Create a new journal entry for today (if required)
#
sh $MAC_FLOW/journal/journal-add-day.sh "$fullpath"

#
# Time to create our todo!
#
journaltask="$funicon **$taskname** - $description" 

echo "$journaltask" >> $fullpath
sh $MAC_FLOW/tasks/tasks-create-item.sh "$tasklist" "$description"

echo "- Added to journal: $journaltask " | lolcat

# $(date '+%A, %B %d %Y at %H:%M')

#m365 todo task add -t "$taskdescription" --listName "$tasklist" >> /dev/null