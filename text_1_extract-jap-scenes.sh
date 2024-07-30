#!/bin/bash
shopt -s extglob
set -e

# Extracts text from scenes (aka chapters, main text) to text files with the original encoding.
# Before running this, iso and afs packages must be unpacked, so that .SCN files are present in n7_mac/ folder.

extract_text() {
	f=`basename $1 .SCN`
	echo "Extracting scene $f text"
        # process translation files
        ./bin/extract_scene_text n7_mac/$f.SCN text/tmp/mac-jp-psp/$f.txt
}

mkdir -p text/tmp/mac-jp-psp/
for i in n7_mac/[A-Z0-9]*_[0-9]*.SCN \
	 n7_mac/?([A-Z])L[0-9]D[0-9]?([A-Z]).SCN \
	 n7_mac/?(D)C_*.SCN \
	 n7_mac/[A-Z]POOL.SCN \
	 n7_mac/[A-Z]CYARI.SCN \
	 n7_mac/USER*.SCN \
	 n7_mac/{HTURI,HUMI,IKIMO,ILUNA,KJINJYA,YHANA,SCOTTAGE,OP}.SCN
do extract_text $i; done

echo "Done."
