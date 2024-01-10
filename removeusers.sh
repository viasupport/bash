#!/bin/bash

# If you know UID range for user removal
START_UID=900
END_UID=998

# Read each line in /etc/passwd
while IFS=: read -r username password uid gid info home shell; do
    # Check if the UID is within the specified range
    if [ "$uid" -ge $START_UID ] && [ "$uid" -le $END_UID ]; then
        echo "Removing user: $username (UID: $uid)"
        sudo userdel -r "$username"
    fi
done < /etc/passwd

echo "Users with UID from $START_UID to $END_UID have been removed."
