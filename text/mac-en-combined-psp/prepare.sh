#!/bin/sh

path="${0%/*}"

rm -r $path/old 2>/dev/null
mkdir $path/old

for i in $path/utf8/*.txt; do sed -i -e 's|ç|c|g' -e 's|´|é|g' -e 's|`|à|g' -e 's|¨|ö|g' $i; done

for i in $path/utf8/*.txt; do sed -i -e 's|é|▲|g' -e 's|à|▽|g' -e 's|ö|▼|g' $i; done
for i in $path/utf8/*.txt; do iconv -f UTF-8 -t CP932 $i -o $path/`basename $i`; done
cp $path/*.txt $path/old
for i in $path/*.txt; do sed -i -e 's|\x81\xa3|\x87\xa7|g' -e 's|\x81\xa4|\x87\xa8|g' -e 's|\x81\xa5|\x87\xa9|g' $i; done
