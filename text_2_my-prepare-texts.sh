#!/bin/sh
set -e

TMPDIR=./text/tmp/mac-en-combined-psp-temp
UTF8DIR=./text/mac-en-combined-psp-utf8
TARGETDIR=./text/tmp/mac-en-combined-psp

rm -r $TARGETDIR $TMPDIR 2>/dev/null || true
mkdir -p $TARGETDIR $TMPDIR

for i in $UTF8DIR/*.txt; do sed -i -e 's|ç|c|g' -e 's|´|é|g' -e 's|`|à|g' -e 's|¨|ö|g' $i; done
cp $UTF8DIR/*.txt $TMPDIR
for i in $TMPDIR/*.txt; do
	sed -i -e 's|é|份|g' -e 's|à|仿|g' -e 's|ö|伃|g' $i
	iconv -f UTF-8 -t SHIFT_JISX0213 $i -o $TARGETDIR/`basename $i`
done
rm -r $TMPDIR
