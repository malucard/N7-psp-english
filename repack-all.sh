#!/bin/sh
set -e

./text_2_prepare-texts.sh
./pack-afs.sh
./pack-iso.sh
