.PHONY: setup/notbad setup/autism clean

setup/notbad:
	sudo nixos-rebuild switch --flake ".#notbad"

setup/autism:
	sudo nixos-rebuild switch --flake ".#autism"

clean:
	unlink ./result
