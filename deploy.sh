#!/bin/bash

# Load RVM into a shell session *as a function*
[[ -s "/home/andreas/.rvm/scripts/rvm" ]] && source "/home/andreas/.rvm/scripts/rvm"  

# Create static site
rake generate

# Publish site to GitHub
rake deploy


if [[ -z "$1" ]]; then 
	message="Updated source `date`"
else
	message="$1"; 
fi

# Commit source
git add .
git commit -a -m "$message"
git push origin


