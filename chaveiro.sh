#!/bin/bash

sudo -E gpg --keyserver pgpkeys.mit.edu --recv-key $1
sudo -E gpg -a --export $1 | sudo -E apt-key add -
