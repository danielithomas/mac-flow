# Mac-Flow
A mac-based workflow that uses the command line and text-based markdown to create journal entries. I wrote this for me so I could get away from fancy editors and back to text. 

## Installation

Assumes you have [homebrew](https://brew.sh/) installed.
Ok, not many things...

First, clone this repo to a place of your choosing e.g. `git clone git@github.com:danielithomas/mac-flow.git`

Run `install.sh` which will install:
1. lolcat: *because screw it*: life is too short. Same as typing `brew install lolcat`
1. iCalBuddy: Or you can just type `brew install ical-buddy`
1. Sets up a new environment variable called `$MAC_FLOW` which is the full path to the place where mac-flow scripts are located.
1. Checks to see if you have a ~/journal directory. If you don't it will create it. *tip: symlink to where you want your journal rather than just using a new folder in your home directory.*
1. Attempts to append settings to your shell. At this stage it assumes you're rocking `zsh`. If you're not, you can manually add the following:

```
export $MAC_FLOW=$HOME/dev/mac-flow
export $JOURNAL_DIR=$HOME/journal
source $MAC_FLOW/set-aliases.sh
```

Of course, you can edit all of the above, but this should be enough to get you started. 
