#!/bin/sh
set -e

WORKDIR=./iso
ORIGINAL_ISO=$WORKDIR/Remember11-jap.iso
REPACKED_ISO=$WORKDIR/r11-repacked.iso
PATCH_FILE=$WORKDIR/r11binarin.xdelta

rm $PATCH_FILE 2>/dev/null || true
isosize=$(stat -c %s $REPACKED_ISO)

echo generating `basename $PATCH_FILE`
xdelta3 -v -e -S lzma -9 -B $isosize -A -s $ORIGINAL_ISO $REPACKED_ISO $PATCH_FILE
echo "done!"
