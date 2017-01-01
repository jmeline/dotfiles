#!/bin/bash

echo "Grabbing latest emacs from git.savannah.gnu.org"
OLDPATH=`pwd`
cd /Users/jacmeli/Projects/emacs/

function emacs_make()
{
  make clean
  ./configure --with-ns
  make install
  cp ./nextstep/Emacs.app /Applications
}

function clean_build() {
  if [ -d build ]
  then
    echo "removing build folder"
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
    emacs_make
  elif [ $REMOTE = $BASE ]; then
    echo "Need to push"
  else
    echo "Diverged"
  fi
}

update_git
cd $OLDPATH
