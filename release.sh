#!/bin/sh
set -e

./cleanup.sh
./compile.sh
./mymake.sh
./generate-patch.sh
