#!/bin/bash

mkisofs -U -xa -A "PSP GAME" -V "" -sysid "PSP GAME" -volset "" -p "" -publisher "" -o iso/r11-repacked.iso r11_iso_extracted/
