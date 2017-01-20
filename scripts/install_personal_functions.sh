#!/bin/bash

# mkdir ~/.bin
DIR=~/.bin
echo "Linking personal functions => $DIR"
for file in $(ls ./scripts/bin)
do
  echo "file: $file -> $DIR"
  ln -sf $(pwd)/scripts/bin/$file  ~/.bin/$file
done

for file in $(ls ./scripts | grep color)
do
  echo "file: $file -> $DIR"
  ln -sf $(pwd)/scripts/bin/$file  ~/.bin/$file
done


