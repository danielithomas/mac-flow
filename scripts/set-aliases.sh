#!/bin/bash

# ---------------------------------------------------------
# Set Aliases - Sets up Aliases for various scripts
# ---------------------------------------------------------

alias work='source $MAC_FLOW/work.sh'
alias today='source $MAC_FLOW/today-cal.sh'

# Requires the Microsoft 365 CLI environment
alias get-tasks='source $MAC_FLOW/get-tasks.sh "Tasks" | lolcat ' 
alias get-flagged-emails='$MAC_FLOW/get-flagged-emails.sh | lolcat '
alias tasks-done-yesterday='$MAC_FLOW/get-tasks-completed-by-date.sh "Tasks" "$(date -v -1d '+%Y-%m-%d')" | lolcat '
