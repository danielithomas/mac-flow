#!/bin/bash

# Returns a list of current tasks from Microsoft Todo that have not been completed

# expecting argument:
# 1 - List Name 
listname="$1"

m365 todo task list --listName $listname --query "[?status!='completed'].{Task: title}" | awk '{if(NR>2)print}' | sed -e '$!s/^/ 🔸 /'