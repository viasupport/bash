#!/bin/bash
#Check the ping and notification display in Ubuntu 20+ versions

echo -n "Enter IP:"
read IP

while true
do
    if ping -c 1 $IP &> /dev/null
    then
        echo "Host is up"
        # Break the loop and proceed with the rest of your code
	notify-send "The $IP is online"
	break
    else
        echo "Host is down, retrying..."
        # Optional: sleep for a bit before retrying
        sleep 1
    fi
done


