#!/bin/sh

path="${0%/*}"

rm -r $path/workdir $path/utf8 2>/dev/null
mkdir $path/workdir $path/utf8

cp $path/*.txt $path/workdir
for i in $path/workdir/*.txt; do sed -i -e 's|\x87\xa7|\x81\xa3|g' -e 's|\x87\xa8|\x81\xa4|g' -e 's|\x87\xa9|\x81\xa5|g' $i; done
for i in $path/workdir/*.txt; do iconv -f CP932 -t UTF-8 $i -o $path/utf8/`basename $i`; done
for i in $path/utf8/*.txt; do sed -i -e 's|▲|é|g' -e 's|▽|à|g' -e 's|▼|ö|g' $i; done
#for i in utf8/*.txt; do sed -i -e 's|c|ç|g' -e 's|é|´|g' -e 's|à|`|g' -e 's|ö|¨|g' $i; done
#for i in utf8/*.txt; do iconv -f UTF-8 -t CP932 $i -o cp932/`basename $i`; done

rm -r $path/workdir
