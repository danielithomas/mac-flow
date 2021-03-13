# Mac-Flow
A mac-based workflow that uses the command line and text-based markdown to create journal entries. I wrote this for me so I could get away from fancy editors and back to text. 

**YMMV** - Like most of these little scripted things, it's set up to work in with the author's workflow. Your mileage may (definitely) vary. If it doesn't quite work: Fork it, pop the hood and take a look around in horror at what my careless hands have wrought... 

## Usage
Once things are set up to your liking, at your terminal just type:

```
work I did some stuff
```

... and this will add new entries into your new journal. 

```
today
```

... Will print your remaining appointments for today

### Double-plus good bonus 
We all have stuff we want to get done, so if you have the Microsoft 365 cli installed you can type

```
get-tasks
```

... And you'll get a list of tasks from Microsoft Todo that are not completed. 

"Tasks" is the default list in Microsoft Todo, but if you create "Ideas" and "Parked" you can type the following commands:

```
action Adds an item to you Tasks list
idea Adds an idea you have to the Ideas list
parked Adds an item that you might want to do eventually, but is not something on your daily Tasks radar. Instead, this item is added to your Parked list.
```

All items added in Microsoft Todo are also recorded in your journal.

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

### Setting up ToDo's! 
These scripts also use the [Microsoft 365 CLI](https://pnp.github.io/cli-microsoft365/) so you can include things like Microsoft Todo into your personal workflow. 

Just head on over to the [Microsoft 365 Installation Guide](https://pnp.github.io/cli-microsoft365/user-guide/installing-cli/) for how to install. Once installed, remember to use the command `m365 login` to set up your credentials etc. 

