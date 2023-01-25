#!/bin/bash

## For those times where the lock isn't released when listing backups
borg break-lock ssh://root@10.43.96.5/mnt/disk2/Backup/linux/archlinux
