#!/bin/sh
set -e

./unpack-iso.sh
./unpack-afs.sh
./text_1_extract-jap-scenes.sh
./text/mac-en-combined-psp/prepare.sh
./pack-afs.sh
./pack-iso.sh
