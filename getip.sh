#!/bin/bash
notify-send "IP EXTERNO:" "$(curl ifconfig.me)" --icon="network"
