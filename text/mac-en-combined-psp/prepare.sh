#!/bin/sh

path="${0%/*}"

rm -r $path/old $path/workdir 2>/dev/null
mkdir $path/old $path/workdir

for i in $path/utf8/*.txt; do sed -i -e 's|ç|c|g' -e 's|´|é|g' -e 's|`|à|g' -e 's|¨|ö|g' $i; done
cp $path/utf8/*.txt $path/workdir/
for i in $path/workdir/*.txt; do sed -i -e 's|é|份|g' -e 's|à|仿|g' -e 's|ö|伃|g' $i; done
cp $path/*.txt $path/old/
for i in $path/workdir/*.txt; do iconv -f UTF-8 -t SHIFT_JISX0213 $i -o $path/`basename $i`; done
rm -r $path/workdir
