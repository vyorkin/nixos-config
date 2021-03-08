.PHONY: build/notbad build/autism clean

build/notbad:
	sudo nixos-rebuild build --flake ".#notbad"

build/autism:
	sudo nixos-rebuild build --flake ".#autism"

clean:
	unlink ./result
