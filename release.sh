#!/bin/sh
set -e

./cleanup.sh
./compile.sh
./make.sh
./generate-patch.sh
