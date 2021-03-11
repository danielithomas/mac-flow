#!/bin/bash

# Returns a list of current tasks from Microsoft Todo that have been completed on a specific date

# expecting argument:
# 1 - List Name 
# 2 - Date (in the format yyyy-mm-dd)
listname="$1"
datecheck="$2"

m365 todo task list --listName "$listname" --query "[?status == 'completed']|[?contains(lastModifiedDateTime, '$datecheck')].{Tasks: title}" | awk '{if(NR>2)print}' | sed -e '$!s/^/ ✅ /' 

