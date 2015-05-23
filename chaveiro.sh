#!/bin/bash

sudo gpg --keyserver pgpkeys.mit.edu --recv-key $1
sudo gpg -a --export $1 | sudo apt-key add -
