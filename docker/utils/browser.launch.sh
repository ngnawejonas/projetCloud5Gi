#!/bin/bash
URL=$1
path=$(which xdg-open || which gnome-open) && exec "$path" "$URL"
echo "Can't find browser"
