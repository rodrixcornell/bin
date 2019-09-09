#!/bin/bash

sudo -E gpg --keyserver subkeys.pgp.net --recv-key $1
sudo -E gpg -a --export $1 | sudo -E apt-key add -
