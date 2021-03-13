#!/bin/bash
# ------------------------------------------------------
# work.sh - Log some work activity
# ------------------------------------------------------

# Format is that there is a new file for each month.  Each new day entry adds 
# some header information about today's agenda, and then entries are appended 
# under that date. Entries are in the format:
#
# **@HHMM** - [thing that I Did]
#
# The asterix surrounding the @HHMM component are markown for bold text.
#
# @0930 in a journal entry, is the equivalent of saying "At 9:30". Hours are
# in 24-hour format.
#

# ALL the arguments (basically the entire string is considered a text entry)
str="'$*'" 
echo "Adding Activity to log..." | lolcat

# Build the full path of the journal file
# File Format is... 
# YEAR-MONTH.md
filename=$(date +%Y-%B).md
logpath=$JOURNAL_DIR/
fullpath=$logpath$filename

#
# The formatted journal entry. 
#
timestamp=$(date +%H%M)
cleanedentry="$(sed -e "s/^'//" -e "s/'$//" <<< $str)"
workentry=$(printf "**@%-1s** - %s\n" "$timestamp" "$cleanedentry")

#
# Create a new file (if required)
#
sh $MAC_FLOW/journal/journal-create.sh "$fullpath"

#
# Create a new journal entry for today (if required)
#
sh $MAC_FLOW/journal/journal-add-day.sh "$fullpath"

#
# Record the journal entry
#
sh $MAC_FLOW/journal/journal-add-entry.sh "$workentry" "$fullpath"
