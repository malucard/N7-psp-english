#!/bin/bash

mkisofs \
	-U \
	-xa \
	-A "PSP GAME" \
	-V "" \
	-sysid "PSP GAME" \
	-volset "" \
	-p "" \
	-publisher "" \
	-o iso/n7-repacked.iso \
	n7_iso_extracted/
