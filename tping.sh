#!/bin/bash

if [ -z "$1" ] || [ "$1" != "-p" ] && [ "$1" != "-"* ]; then
      echo "      $script -h for help"
      echo $1
fi