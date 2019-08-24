#! /bin/bash

PIDFILE="/var/run/deploy.pid"

if [ -s ${PIDFILE} ]; then
  SPID=`cat ${PIDFILE}`
  if [ -e /proc/${SPID}/status ]; then
    echo "The script is already running, does not run repeatedly."
    exit 1
  fi
  cat /dev/null > ${PIDFILE}
fi
echo $$ > ${PIDFILE}

# Working directory
cd /var/www/htdocs

# Reset current HEAD to the specified state
git reset --hard origin/master

# Remove untracked files from the working tree
git clean -f

# Incorporates changes from a remote repository into the current branch.
git pull

cat /dev/null > ${PIDFILE}
