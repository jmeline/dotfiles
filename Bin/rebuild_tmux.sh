#!/bin/bash

echo "Grabbing latest tmux from github"
OLDPATH=`pwd`
cd /Users/jacmeli/Projects/tmux/

function tmux_make()
{
  make clean
  sh autogen.sh
  ./configure && make
  sudo make install
}

function clean_build() {
  if [ -d build ]
  then
    rm -rf build
  fi
}

function update_git() {
  #function_body
  # http://stackoverflow.com/questions/3258243/check-if-pull-needed-in-git
  # DiffCount=$(git rev-list HEAD...origin/master --count)
  git remote update
  LOCAL=$(git rev-parse @)
  REMOTE=$(git rev-parse @{u})
  BASE=$(git merge-base @ @{u})
  if [ $LOCAL = $REMOTE ]; then
    echo "Up-to-date"
  elif [ $LOCAL = $BASE ]; then
    echo "Need to pull"
    git pull
    clean_build
    tmux_make
  elif [ $REMOTE = $BASE ]; then
    echo "Need to push"
  else
    echo "Diverged"
  fi
}
update_git
cd $OLDPATH
