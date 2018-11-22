#!/bin/bash

# Disable macOS Upgrade notifications

# Step 1: prevent the update which brings the notification down
softwareupdate --ignore macOSInstallerNotification_GM

echo

# Step 2: delete the file if it's already on the computer
if [[ -d /Library/Bundles/OSXNotification.bundle ]]; then
    echo "OSXNotification.bundle found. Deleting..."
    rm -rf /Library/Bundles/OSXNotification.bundle ||:
else
    echo "OSXNotification.bundle not found."
fi