#!/bin/bash
#
# keycode 66 = Caps_Lock
# keycode 64 = Alt_L
# keycode 77 = Num_Lock

echo "Mini Keyboard"
xmodmap -e "remove lock = Caps_Lock"
xmodmap -e "keycode 66 = Alt_L"

