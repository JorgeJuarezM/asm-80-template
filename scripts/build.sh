#!/bin/bash
set -e

echo "Building libraries"
lib_files=$(find ./libs -name "*.asm")
./compiler/as8085 -l -o $lib_files
find ./libs -name "*.rel" > libs/xpire.lib

echo "Building game"
find ./src -name "*.asm" | while read f; do
    ./compiler/as8085 -l -o $f
done

echo "Linking game"
rel_files=$(find ./src -name "*.rel")
./compiler/aslink -n -u -l libs/xpire -o -i+game.ihx $rel_files

echo "Converting to binary"
./compiler/hex2bin -p 00  game.ihx

move_files() {
    mkdir -p obj/$1
    mv $1/*.lst $1/*.rel $1/*.hlr obj/$1
}

move_files src
mv game.ihx obj

move_files libs
mv libs/xpire.lib obj/libs

mkdir -p bin/
mv *.bin bin/