#!/bin/bash

#
# Creates a new task in Microsoft Todo. In addition, the item is also
# logged in the journal. 
#

tasklist="$1"
description="$2"

#
# Send the output off the /dev/null because we don't want to do anything with
# the returned output. If we don't do this, it will push the details of the 
# newly created task to stdout.
#
m365 todo task add -t "$description" --listName "$tasklist" >> /dev/null
