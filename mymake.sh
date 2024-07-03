#!/bin/sh
set -e

./unpack-iso.sh
./unpack-afs.sh
./text_1_extract-jap-scenes.sh
./text/mac-en-combined-psp/prepare.sh
./pack-afs.sh
cp n7_xmb/*.* n7_iso_extracted/PSP_GAME/ # for v0.3
./pack-iso.sh
