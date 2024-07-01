#!/bin/bash
shopt -s extglob
set -e

# Extracts text from scenes (aka chapters, main text) to text files with the original encoding.
# Before running this, iso and afs packages must be unpacked, so that .SCN files are present in n7_mac/ folder.

extract_text() {
	f=`basename $1 .SCN`
	echo "Extracting scene $f text"
        # process translation files
        ./bin/extract_scene_text n7_mac/$f.SCN text/tmp/mac-jp-psp/$f.txt || exit 1;
}

mkdir -p text/tmp/mac-jp-psp/
for i in n7_mac/[A-Z0-9]*_[0-9]*.SCN ; do extract_text $i; done
for i in n7_mac/?([A-Z])L[0-9]D[0-9]?([A-Z]).SCN ; do extract_text $i; done
for i in n7_mac/?(D)C_*.SCN; do extract_text $i; done
for i in n7_mac/[A-Z]POOL.SCN ; do extract_text $i; done
for i in n7_mac/[A-Z]CYARI.SCN ; do extract_text $i; done
for i in n7_mac/USER*.SCN ; do extract_text $i; done

for i in HTURI HUMI IKIMO ILUNA KJINJYA YHANA SCOTTAGE OP; do extract_text n7_mac/$i.SCN; done

echo "Done."
