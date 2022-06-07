#!/bin/bash

systemctl start borg-backup-my-computer.service

watch systemctl status borg-backup-my-computer.service
