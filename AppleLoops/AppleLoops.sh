#!/bin/bash

# Download the Zip file of the GitHub Repository
/usr/bin/curl -o /tmp/appleLoops.zip -LO https://github.com/carlashley/appleloops/archive/refs/heads/master.zip

# Extract Zip 
/usr/bin/unzip -q /tmp/appleLoops.zip -d /tmp

# Run the tool to download and install Apple Loops
#Updated to call using python to fix Appleloops3 November 2020 update

/usr/bin/python3 /tmp/appleLoops-master/appleloops --deployment -a garageband -q -m -o -u


# Cleanup
rm -rf /tmp/appleLoops-master
rm -f /tmp/appleLoops.zip

#Fix GB Downloader
currentuser=`stat -f "%Su" /dev/console`
su "$currentuser" -c "rm -R ~/Library/Containers/com.apple.garageband10/Data/Library/Preferences/com.apple.garageband10.plist"

exit 0