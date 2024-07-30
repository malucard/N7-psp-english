#!/bin/sh
set -e

./unpack-iso.sh
./unpack-afs.sh
./text_1_extract-jap-scenes.sh
./text_2_my-prepare-texts.sh
./pack-afs.sh
./pack-iso.sh
