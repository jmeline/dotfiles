#!/bin/bash

youtube-dl -f best $1 --add-metadata --write-info-json --write-description --write-annotation --write-thumbnail
