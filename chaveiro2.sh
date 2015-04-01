#!/bin/bash

gpg --keyserver subkeys.pgp.net --recv-key $1
gpg -a --export $1 | sudo apt-key add -
