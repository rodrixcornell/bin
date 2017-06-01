#!/bin/bash

echo "Mini Keyboard"
xmodmap -e "remove lock = Caps_Lock"
xmodmap -e "keycode 66 = Alt_L"

