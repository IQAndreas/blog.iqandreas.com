#!/bin/bash

# Load RVM into a shell session *as a function*
[[ -s "/home/andreas/.rvm/scripts/rvm" ]] && source "/home/andreas/.rvm/scripts/rvm"  

# Create static site
rake generate

# Publish site to GitHub
rake deploy

# Commit source
git add .
git commit -a -m "Updated source `date`"
git push origin