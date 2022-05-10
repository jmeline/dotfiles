#!/bin/bash

cd /etc/pacman.d
sudo rm -rf gnupg
cd -
sudo pacman-key --init && sudo pacman-key --populate archlinux
