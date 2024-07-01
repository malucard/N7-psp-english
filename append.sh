#!/bin/sh
set -e

TL_SUFFIX="en"
PY=python3
COMPRESS=./bin/compressbip
REPACK_AFS=./bin/repack_afs
WORKDIR=./workdir
ISO_RES_DIR=./n7_iso_extracted/PSP_GAME/USRDIR
[ $# -ge 1 ] && TL=$1 || TL=text/other-psp-${TL_SUFFIX}/APPEND.SCN.txt
mkdir -p n7_mac_${TL_SUFFIX}/

$PY ./py-src/apply_shortcuts_translation.py $TL n7_mac/APPEND.SCN n7_mac_${TL_SUFFIX}/APPEND.SCN ${TL_SUFFIX} || exit 1;
$COMPRESS ./n7_mac_${TL_SUFFIX}/APPEND.SCN ./n7_mac_${TL_SUFFIX}/APPEND.BIP

$REPACK_AFS $WORKDIR/mac.afs $WORKDIR/mac-repacked.afs ./n7_mac_${TL_SUFFIX} || exit 1;
mv -f $WORKDIR/mac-repacked.afs $ISO_RES_DIR/mac.afs

./pack-iso.sh
