#!/bin/bash
ISO_RES_DIR=iso_extracted/PSP_GAME/USRDIR
ISO_BIN_DIR=iso_extracted/PSP_GAME/SYSDIR
WORKDIR=./workdir
COMPRESS=./bin/compressbip
REPACK_AFS=./bin/repack_afs
REPACK_SCENE=text/repack_scene.py
ARMIPS=./tools/armips
if [ `uname` == "Darwin" ]; then
    ARMIPS=./tools/armips_osx
elif [ `uname` == "Linux" ]; then
    ARMIPS=./tools/armips_lin64
fi


# Apply init and EBOOT strings
./text/apply-boot-translation.py text/other-psp/BOOT.BIN.psp.txt workdir/BOOT.BIN workdir/BOOT.BIN.en || exit 1;
./text/apply-init-translation.py text/other-psp/init.psp.txt workdir/init.dec workdir/init.dec.en || exit 1;


# Repack mac.afs (texts)
START=$(date +%s.%N)
mkdir -p mac-en/
./text/apply-shortcuts-translation.py text/other-psp/SHORTCUT.SCN.psp.txt mac/SHORTCUT.SCN mac-en/SHORTCUT.SCN || exit 1;
$COMPRESS ./mac-en/SHORTCUT.{SCN,BIP}
repack_scene () {
	$REPACK_SCENE text/mac-combined-psp/$1.txt mac/$1.SCN mac-en/$1.SCN
	$COMPRESS ./mac-en/$1.{SCN,BIP}
}
for i in text/mac-combined-psp/*.txt ; do
	echo Repacking $i
	repack_scene `basename $i .txt` & WAITPIDS="$! "$WAITPIDS
done
wait $WAITPIDS &> /dev/null
END=$(date +%s.%N)
DIFF=$(echo "$END - $START" | bc)
echo "Finished repacking scenes in: "$DIFF

$REPACK_AFS $WORKDIR/mac.afs $WORKDIR/mac-repacked.afs ./mac-en || exit 1;
mv -f $WORKDIR/mac-repacked.afs $ISO_RES_DIR/mac.afs


# Repack fonts
cd text/font
# python3 extract-font.py autotrim || exit 1;
# python3 extract-font.py pnghalf || exit 1;
mkdir -p ../../etc-en
cp -f glyphs-new/* glyphs/
python3 extract-font.py repack glyphs/ || exit 1;
cp FONT00.NEW ../../etc-en/FONT00.NEW
cd ../..


# Repack etc.afs
#for i in etc-en/*.FNT ; do
#	echo $i
#	f=`basename $i .FNT`
#	$COMPRESS etc-en/$f.{FNT,FOP}
#done
if [ -f etc-en/FONT00.NEW ]; then
$COMPRESS etc-en/FONT00.NEW etc-en/FONT00.FOP
$REPACK_AFS $WORKDIR/etc.afs $WORKDIR/etc-repacked.afs etc-en || exit 1;
mv -f $WORKDIR/etc-repacked.afs $ISO_RES_DIR/etc.afs
fi


# Repack init.bin
INIT_SRC=$WORKDIR/init.dec.en
if [ ! -f $INIT_SRC ]; then
	# If modified file does not exist, just repack the original one.
	# Used for testing purposes
	INIT_SRC=$WORKDIR/init.dec
fi
echo "Compressing $INIT_SRC"
$COMPRESS $INIT_SRC $WORKDIR/init.en.bin || exit 1;
mv -f $WORKDIR/init.en.bin $ISO_RES_DIR/init.bin


# Patch BOOT.BIN
echo "Applying patches to EBOOT (BOOT.BIN)"
cp -f $WORKDIR/BOOT.BIN.en $WORKDIR/BOOT.BIN.patched
$ARMIPS src/boot-patches.asm -root workdir/ || exit 1;
#rm -f $ISO_BIN_DIR/BOOT.BIN
rm -f $ISO_BIN_DIR/EBOOT.BIN
cp -f $WORKDIR/BOOT.BIN.patched ./$ISO_BIN_DIR/EBOOT.BIN
cp -f $WORKDIR/BOOT.BIN.patched ./$ISO_BIN_DIR/BOOT.BIN
#cp -f $WORKDIR/BOOT.bin $ISO_BIN_DIR/BOOT.BIN #unnecessary
