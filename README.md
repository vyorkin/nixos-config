## My personal NixOS configuration

### Prerequisites

Make sure you have `git` installed:

```bash
$ nix-env -iA nixos.git
```

Setup channels:

```bash
$ sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
$ sudo nix-channel --add https://github.com/NixOS/nixos-hardware/archive/master.tar.gz nixos-hardware
$ sudo nix-channel --add https://github.com/rycee/home-manager/archive/master.tar.gz home-manager
$ sudo nix-channel --update
```

Install home-manager:

```bash
$ nix-shell '<home-manager>' -A install
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

Configure the NixOS machine:

```bash
$ nixos-rebuild switch --upgrade
```

Symlink and build the home config:

```bash
$ mv ~/.config/nixpkgs ~/.config/nixpkgs-backup
$ sudo ln -s /etc/nixos/home ~/.config/nixpkgs
$ home-manager switch
```

### Layout

main:

- `home/` - Home-manager configurations
- `cfgs/` - Package configurations
- `hosts/` - Host specific configurations
- `roles/` - Shared configurations
- `pkgs/` - Custom packages
- `options/` - Option files for custom packages
- `overlays/` - Custom overlays

submodules:

- `darwin/` - Nix modules for Darwin
- `home-manager/` - Home manager using Nix

### Links

* [rummik/nixos-config](https://github.com/rummik/nixos-config)
* [danieldk/nix-home](https://github.com/danieldk/nix-home)
