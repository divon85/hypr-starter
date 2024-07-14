#!/bin/bash

# Check for internet connection
if ping -q -c 1 -W 1 google.com >/dev/null; then
    version=$(cat ~/.dotfiles/.version/version)
    online=$(curl -s https://raw.githubusercontent.com/divon85/hypr-starter/main/.version/name)
    if [ "$version" -lt "$online" ]; then
        # Update available
        echo "0"
    else
        # No update available
        echo "1"
    fi
else
    # Network is down
    echo "1"
fi