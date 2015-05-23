#!/bin/bash

sudo gpg --keyserver subkeys.pgp.net --recv-key $1
sudo gpg -a --export $1 | sudo apt-key add -
