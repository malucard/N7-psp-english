#!/bin/bash
for i in r11_iso_extracted/PSP_GAME/SYSDIR/UPDATE/*.* ; do rm $i; touch $i ; done

mkisofs -U -xa -A "PSP GAME" -V "" -sysid "PSP GAME" -volset "" -p "" -publisher "" -o iso/r11-repacked.iso r11_iso_extracted/
