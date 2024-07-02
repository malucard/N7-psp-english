#!/bin/sh

ISO_FILE=iso/Remember11-jap.iso

#isoinfo -f -i iso/Remember11-jap.iso | nl -nln -s ";" | awk -F ";" '{print substr($2,2) " -" $1}' > iso/sort_file
echo "Extracting ISO '$ISO_FILE'."
7z x -y $ISO_FILE -or11_iso_extracted/

