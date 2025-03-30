build_asm: clean
	docker compose -f docker/docker-compose.yml run --rm builder

clean:
	@rm -rf obj bin

run: build_asm
	python ../../../xpire/main.py run .bin/game.bin -m cpm80