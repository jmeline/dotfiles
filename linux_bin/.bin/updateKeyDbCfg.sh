#!/bin/bash

cd ~/.config/aacs

curl 'http://fvonline-db.bplaced.net/fv_download.php?lang=eng' -Lo key.zip
unzip key.zip
rm key.zip

cd -
