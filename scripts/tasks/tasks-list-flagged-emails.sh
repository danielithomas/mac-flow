#!/bin/bash

# Returns a list of current flagged emails from Microsoft Todo that have not 
# been completed

#
# List returned is cleaned up, with the header row removed. Each line gets a 
# fancy bullet and any leftover whitespace is removed
#
m365 todo task list --listName "Flagged Emails" --query "[?status!='completed'].{Task: title}" | awk '{if(NR>2)print}' | sed -e '$!s/^/ 🚩 /' | tr -s ' '