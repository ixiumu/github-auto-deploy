#!/bin/bash

# Working directory
cd /var/www/htdocs

# check
git status | grep "added to commit" >/dev/nul

if [ $? != 0 ]; then
  echo "nothing to commit, working tree clean."
  exit 0
fi

# push
git add .
git commit -m "✨Auto commit #$(date +%m%d%H)"
git push
