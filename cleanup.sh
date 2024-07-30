#!/bin/bash

rm -f iso/n7-repacked.iso
rm -f patch/n7binarin.xdelta
rm -rf n7_mac/ n7_etc/ n7_iso_extracted/ n7_mac_en/ n7_etc_en/
rm -rf bin/
rm -f workdir/{mac.afs,etc.afs,init.*,BOOT.BIN*}
rm -rf text/tmp
rm -rf text/mac-en-combined-psp/{*.txt,old}
rm -f text/font/FONT00.{FNT,mod}
