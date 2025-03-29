#!/bin/bash
set -e
cd /code/

# find . -name "*.asm" ! -name "boot.asm" -exec ./compiler/as8085 -l -o {} \;

find . -name "*.asm" | while read f; do
    ./compiler/as8085 -l -o $f
done


rel_files=$(find . -name "*.rel")
./compiler/aslink -n -u -o  -a _ColorAttrs=0x4000 \
                            -a _DATA=0x4010 \
                            -a _CODE=0x50 \
                            -i+game.ihx ${rel_files}
./compiler/hex2bin -p 00  game.ihx
mkdir -p obj/
mv *.ihx *.rst *.lst *.rel *.hlr obj/
mkdir -p bin/
mv *.bin bin/