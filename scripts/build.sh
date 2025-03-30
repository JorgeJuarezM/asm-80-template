#!/bin/bash
set -e

echo "Building libraries"
find ./libs -name "*.asm" | while read f; do
    ./compiler/as8085 -l -o $f
done
find ./libs -name "*.rel" > libs/xpire.lib

echo "Building game"
find ./src -name "*.asm" | while read f; do
    ./compiler/as8085 -l -o $f
done

echo "Linking game"
rel_files=$(find ./src -name "*.rel")
./compiler/aslink -n -u -a _CODE=0x100 -l libs/xpire -o -i+game.ihx $rel_files

echo "Converting to binary"
./compiler/hex2bin -p 00  game.ihx

mkdir -p .obj/src
find ./src -name "*.rel" -exec mv {} .obj/src \;
find ./src -name "*.lst" -exec mv {} .obj/src \;
find ./src -name "*.hlr" -exec mv {} .obj/src \;
find ./src -name "*.rst" -exec mv {} .obj/src \;

mkdir -p .obj/libs
find ./libs -name "*.rel" -exec mv {} .obj/libs \;
find ./libs -name "*.lst" -exec mv {} .obj/libs \;
find ./libs -name "*.hlr" -exec mv {} .obj/libs \;
find ./libs -name "*.lib" -exec mv {} .obj/libs \;

mv game.ihx .obj/game.ihx
mkdir -p .bin
mv game.bin .bin/
