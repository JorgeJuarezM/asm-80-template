.PHONY: build_asm clean run
default: build_asm

build_asm: clean
	docker compose run --rm builder

clean:
	@rm -rf .obj .bin

run: build_asm
	python ../../../xpire/main.py run .bin/game.bin -m cpm80
