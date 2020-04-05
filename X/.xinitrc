#!/usr/bin/env bash

. ~/.profile  # Necessary for Debian!

# Merge custom Xresources setup.
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Launch dropbox.
dropbox start

# Launch i3.
# Use 25 MiB of RAM for debug logs.
exec i3 --shmlog-size=26214400
