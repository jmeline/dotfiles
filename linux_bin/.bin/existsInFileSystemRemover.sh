#!/bin/bash

echo "Looping through $1"

mkdir packagesToDestroy

while IFS= read -r line;
do
  echo "$line"
  yay -Qo "$line"
  if [ $? -eq 1 ]
  then
    echo -e "\tStaged for deletion -> $line"
    sudo mv $line packagesToDestroy
  else
    echo "$line is fine and is owned by someone"
  fi
done < "$1"
