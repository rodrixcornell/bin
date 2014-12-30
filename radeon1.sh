#!/bin/bash

while true; do echo Radeon $(sensors | tail -2 | head -1 | awk '{print $2}'); sleep 2s; clear; done


