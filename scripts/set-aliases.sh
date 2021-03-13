#!/bin/bash

# ---------------------------------------------------------
# Set Aliases - Sets up Aliases for various scripts
# ---------------------------------------------------------

alias work='source $MAC_FLOW/work.sh'
alias today='source $MAC_FLOW/today-cal.sh'

# Requires the Microsoft 365 CLI environment
alias get-tasks='source $MAC_FLOW/tasks/tasks-list-active.sh "Tasks" | lolcat ' 
alias get-flagged-emails='source $MAC_FLOW/tasks/tasks-list-flagged-emails.sh | lolcat '
alias tasks-done-yesterday='source $MAC_FLOW/tasks/tasks-list-completed-date.sh "Tasks" "$(date -v -1d '+%Y-%m-%d')" | lolcat '

#alias park='source task_add "parked" "Park" "$*"'

#
# Tasks (Microsoft todo)
#
action() {
    task_add "action" "Tasks" "$*"
}

idea() {
	task_add "idea" "Ideas" "$*"
}

park() { 
    task_add "parked" "Parked" "$*" 
}

task_add() {
    action="$1"
    tasklist="$2"
    descriptor="$3"
    # Call with sh to ensure that the parameters passed are correct
	sh $MAC_FLOW/tasks/tasks-add.sh $action $tasklist $descriptor
}
