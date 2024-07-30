#!/bin/sh
GAME="n7"
for i in ${GAME}_iso_extracted/PSP_GAME/SYSDIR/UPDATE/*.* ; do rm $i; touch $i ; done # remove update files
cp n7_xmb/*.* n7_iso_extracted/PSP_GAME/

mkisofs \
	-U \
	-xa \
	-A "PSP GAME" \
	-V "" \
	-sysid "PSP GAME" \
	-volset "" \
	-p "" \
	-publisher "" \
	-o iso/${GAME}-repacked.iso \
	${GAME}_iso_extracted/
