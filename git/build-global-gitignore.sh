#!/bin/bash

# Start with a fresh global-gitignore
rm ~/.gitignore_global > /dev/null 2>&1

# Edit these lines to refer to files inside the Global directory of the gitignore repo:
Common_Globals="Dropbox Emacs Vim"
Mac_Globals="macOS"
Linux_Globals="Linux"




# Function to take in a string like Common_Globals, and spit out the contents of the files it references.
# Assumes that they are located in git/gitignore-tempates/Global relative to this script.
process_gitignore_list() {
  files_to_process=$(echo $@ | sed 's/$/.gitignore/' | sed 's/ /.gitignore\'$'\n/g' | sed 's/^/git\/gitignore-templates\/Global\//g')
  while IFS= read -r line; do
    echo "###~~~ From $line ~~~###" >> ~/.gitignore_global
    cat "$line" >> ~/.gitignore_global
  done <<< "$files_to_process"
}


# Process the various lists at the top, conditionally on the OS.
process_gitignore_list $Common_Globals

if [ `uname` = "Darwin" ]; then
  process_gitignore_list $Mac_Globals
fi

if [ `uname` = "Linux" ]; then
  process_gitignore_list $Linux_Globals
fi

