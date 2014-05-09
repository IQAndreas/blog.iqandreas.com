#!/bin/bash

# Load RVM into a shell session *as a function*
# NOTE: Not necessary if you already have a line similar to this in '~/.bash_profile'
[[ -s "/home/andreas/.rvm/scripts/rvm" ]] && source "/home/andreas/.rvm/scripts/rvm"  

# Create static site
rake generate

# Publish site to GitHub
rake deploy

# Fetch the optional commit message (as an argument)
if [[ -z "$1" ]]; then 
	message="Updated source `date`"
else
	message="$1"; 
fi

# Push the changes to 'source' to GitHub
echo ""
echo "## Commit source to GitHub"
git add .
git commit -a -m "$message"
git push origin source


