#!/bin/bash

cd $(pwd)

echo $(__git_ps1 "%s")
