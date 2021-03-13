#!/bin/bash

# Returns a list of current tasks from Microsoft Todo that have been completed 
# on a specific date

# expecting argument:
# 1 - List Name 
# 2 - Date (in the format yyyy-mm-dd)
listname="$1"
datecheck="$2"

#
# List returned is cleaned up, with the header row removed. Each line gets a 
# fancy bullet and any leftover whitespace is removed
#
m365 todo task list --listName "$listname" --query "[?status == 'completed']|[?contains(lastModifiedDateTime, '$datecheck')].{Tasks: title}" | awk '{if(NR>2)print}' | sed -e '$!s/^/ ✅ /' | tr -s ' '

# Yes, JMESpath. I'm glaring at you: Dates. The best I can do here is a direct
# string comparison which makes me die a little inside. 
