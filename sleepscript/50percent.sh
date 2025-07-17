#!/bin/bash
sleep 1m

if [ $((RANDOM % 2)) -eq 0 ]; then
  echo "50% chance: Running the script"
  exit 0
else
  echo "50% chance: Skipping the script"
  exit 1
fi