#!/bin/bash
sudo -E dd if=$1 of=$2 bs=512k status=progress
