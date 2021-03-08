.PHONY: build/notbad build/autism clean

build/notbad:
	nixos-rebuild build --flake ".#notbad"

build/autism:
	nixos-rebuild build --flake ".#autism"

clean:
	unlink ./result
