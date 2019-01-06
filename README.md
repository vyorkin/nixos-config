## My personal NixOS configuration

### Prerequisites

Make sure you have `git` installed.
Add and update `nixos-hardware` channel:

```bash
$ sudo nix-channel --add https://github.com/NixOS/nixos-hardware/archive/master.tar.gz nixos-hardware
$ sudo nix-channel --update nixos-hardware
```

### Usage

Symlink host file from `hosts/<hostname>.nix` to `configuration.nix`.


```bash
export NIXHOST=<HOST_NAME>

sudo sh <<SETUP
mv /etc/nixos /etc/nixos-orig
git clone --recurse-submodules -j8 https://vyorkin@bitbucket.org/vyorkin/nixos-config.git /etc/nixos
cp /etc/nixos-orig/hardware-configuration.nix /etc/nixos
[ ! -e hosts/$NIXHOST.nix ] && mv /etc/nixos-orig/configuration.nix /etc/nixos/hosts/$NIXHOST.nix
ln -sr /etc/nixos/hosts/$NIXHOST.nix /etc/nixos/configuration.nix
SETUP
```

### Layout

main:

- `cfgs/` - Package configurations
- `hosts/` - Host specific configurations
- `presets/` - Shared configurations
- `pkgs/` - Custom packages
- `options/` - Option files for custom packages
- `overlays/` - Custom overlays

submodules:

- `darwin/` - Nix modules for Darwin
- `home-manager/` - Home manager using Nix

### Links

* [rummik/nixos-config](https://github.com/rummik/nixos-config)
* [danieldk/nix-home](https://github.com/danieldk/nix-home)
