#!/bin/bash
#
# keycode 66 = Caps_Lock
# keycode 64 = Alt_L
# keycode 77 = Num_Lock

echo "Mini Keyboard"
#keycode 77 = Num_Lock
#keycode 66 = Caps_Lock
#keycode 50 = Shift_L
#keycode 37 = Control_L
#keycode 133 = Super_L

xmodmap -e "keycode 37 = Control_L"
xmodmap -e "remove lock = Control_L"
xmodmap -e "keycode 37 = Alt_L"

xmodmap -e "keycode 50 = Shift_L"
xmodmap -e "remove lock = Shift_L"
xmodmap -e "keycode 50 = Control_L"

xmodmap -e "keycode 66 = Caps_Lock"
xmodmap -e "remove lock = Caps_Lock"
xmodmap -e "keycode 66 = Shift_L"

xmodmap -e "keycode 77 = Num_Lock"
xmodmap -e "remove lock = Num_Lock"
xmodmap -e "keycode 77 = Caps_Lock"
