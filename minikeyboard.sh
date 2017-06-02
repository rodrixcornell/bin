#!/bin/bash

echo "Mini Keyboard"
xmodmap -e "remove lock = Caps_Lock"
xmodmap -e "keycode 66 = Alt_L"

xmodmap -e "remove lock = Num_Lock"
xmodmap -e "keycode 77 = Caps_Lock"

# keycode 77 = Num_Lock
