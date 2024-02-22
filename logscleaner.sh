#!/bin/bash

# Log cleaner in Ubuntu, Debian OS
# Version 0.5
# Date: 12.01.2024

echo "This script deletes all logs on Ubuntu,Debian OS for all users."

#Check sudo permissions
#if script started not sudo create request to start with sudo permissions - sudo ./logscleaner.sh


#Find all log files for users and remove
rm -rf "$HOME/.local/share/Trash/files/*"
rm -rf "$HOME/.local/share/Trash/info/*"
rm -rf ~./bashrc
rm -rf ~/.cache/
rm -rf ~/.thumbnails/*
rm -rf /tmp/*
rm -rf /var/tmp/*
echo "" > ~/.bash_history && history -c
#END

#Find logs on /var/log folder and remove gz files
for file in $(find /var/log -type f)
do
   #Remove gz files
   if [[ $file == *.gz ]]
      then
	rm $file
      else
	echo "" > $file
   fi
done
# END

#Result
#Write output on this folders for example:
ls -la /var/log
