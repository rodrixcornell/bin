#!/bin/bash

gpg --keyserver pgpkeys.mit.edu --recv-key $1
gpg -a --export $1 | apt-key add -
