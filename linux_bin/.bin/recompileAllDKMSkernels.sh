#!/bin/bash

for directory in $(ls /usr/lib/modules/)
do
  sudo dkms autoinstall -j 0 -k $directory
  echo $?
  if [$? -ne 0];
  then
    echo "FAILED: $directory"
  else
    echo "SUCCESS: $directory"
  fi
done
