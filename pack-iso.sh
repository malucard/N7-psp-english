#!/bin/bash
GAME="n7"
for i in ${GAME}_iso_extracted/PSP_GAME/SYSDIR/UPDATE/*.* ; do rm $i; touch $i ; done

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
