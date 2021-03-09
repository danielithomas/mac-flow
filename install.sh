#!/bin/bash

# ---------------------------------------------------------
# Install bits that help Mac-flow go.
# ---------------------------------------------------------

# lolcat
if ! command -v lolcat &> /dev/null
then
    echo "lolcat not found... Installing"
    brew install lolcat
    exit
fi

# lolcat
if ! command -v icalbuddy &> /dev/null
then
    echo "iCal Buddy not found... Installing"
    brew install ical-buddy 
    exit
fi

# This script's absolute path (Yup, doesn't work if you've got symlinks...)
macflow_base_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Scripts
mac_flow_scripts=$macflow_base_dir/scripts
echo $mac_flow_scripts

DEST="$HOME/journal"
if [[ ! -d "$DEST" ]]
then
    echo "Creating journal directory"
    mkdir $HOME/journal
fi

echo "Adding variables to .zshrc"
echo " " >> ~/.zshrc
echo "# Macflow " >> ~/.zshrc
echo "export MAC_FLOW=$mac_flow_scripts" >> ~/.zshrc
echo "export JOURNAL_DIR=\$HOME/journal" >> ~/.zshrc
echo "source \$MAC_FLOW/set-aliases.sh" >> ~/.zshrc

echo "Mac flow items set up"