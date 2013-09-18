#!/bin/bash

# Load RVM into a shell session *as a function*
[[ -s "/home/andreas/.rvm/scripts/rvm" ]] && source "/home/andreas/.rvm/scripts/rvm"  

# Create static site
rake generate

# Publish site to GitHub
rake deploy

message="Updated source `date`"
[[ -z "$1" ]] && message="$1" 

# Commit source
git add .
git commit -a -m "$message"
git push origin


