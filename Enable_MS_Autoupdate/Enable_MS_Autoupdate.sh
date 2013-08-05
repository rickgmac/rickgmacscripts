#!/bin/sh

# Purpose: Enable MS Update Automatic Checking for current user and User template.
# Project: Corpus
# Author: Rick Goody, rick.goody@mac.com

USER=`/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }'`
ADMINGROUP=`dscl -f "/var/db/dslocal/nodes/Default" localonly -read /Local/Target/Groups/admin GroupMembership | awk -F ": " '{print $NF}'`
ADMINUSERFOUNDS="0"

for i in ${ADMINGROUP[@]}; do
    #echo ${i}
    if [ ${i} = $USER ]; then 
         echo "User $USER is a admin"
        ADMINUSERFOUNDS="1"
    fi
done

if [ "$ADMINUSERFOUNDS" = "1" ]
then
	defaults write "/Users/$USER/Library/Preferences/com.microsoft.autoupdate2" HowToCheck -string Automatic
	defaults write "/System/Library/User Template/English.lproj/Library/Preferences/com.microsoft.autoupdate2" HowToCheck -string Automatic
	chown $USER "/Users/$USER/Library/Preferences/com.microsoft.autoupdate2.plist"
	echo "Changed MS Update Pref for $USER and User Template"
else
	defaults write "/System/Library/User Template/English.lproj/Library/Preferences/com.microsoft.autoupdate2" HowToCheck -string Automatic
	echo "Changed MS Update Pref for User Template"
fi



