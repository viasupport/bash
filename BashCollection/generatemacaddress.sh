#!/bin/bash

iface=eno2   # your interface name
orig=$(ip link show $iface | awk '/link\/ether/ {print $2}')
oui=$(echo $orig | awk -F: '{print $1":"$2":"$3}')
# generate random last three bytes
rand=$(printf "%02X:%02X:%02X" $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256)) | tr 'A-F' 'a-f')
newmac="$oui:$rand"
echo "Original MAC: $orig"
echo "New MAC:      $newmac"
