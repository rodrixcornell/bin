#!/bin/bash

echo Radeon $(sensors | tail -2 | head -1 | awk '{print $2}')

