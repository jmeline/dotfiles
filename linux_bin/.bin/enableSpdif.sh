#!/bin/bash

for i in {1..2}; do
  ## unmute my IEC958 (s/pdif) audio source
  amixer set -c $i IEC958 unmute 2> /dev/null

  ## break out if we have found the right source
  if [ $? -eq 0 ]
  then
    exit 0
  fi
done

