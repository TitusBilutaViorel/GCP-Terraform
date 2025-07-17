#!/bin/bash
sleep 5m

if [ $((RANDOM % 4)) -eq 0 ]; then
  echo "25% chance: Running the script"
  exit 0
else
  echo "25% chance: Skipping the script"
  exit 1
fi