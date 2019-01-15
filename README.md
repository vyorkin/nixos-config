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

Install `home-manager`:

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

### Cachix

https://cachix.org/

### Haskell

Tools:

* [stack2nix](https://github.com/input-output-hk/stack2nix)
* [HIE](https://github.com/domenkozar/hie-nix) - use cachix
* [Komposition](https://owickstrom.github.io/komposition/user-guide/installation/)

### Rust

```bash
$ rustup toolchain add nightly
$ rustup default nightly
$ rustup component add rust-src
$ cargo install bingrep
$ cargo install rusty-tags
$ rustup component add rustfmt-preview --toolchain nightly
$ cargo +nightly install racer
```

### GNOME

Tweaks:

* Set a dark theme, use Numix icon & cursor themes
* Activate and setup extensions you like

### Firefox

Sign-in and (optionally) install these extensions:

* [adblock plus](https://addons.mozilla.org/en-US/firefox/addon/adblock-plus/)
* [stylish](https://addons.mozilla.org/ru/firefox/addon/stylish/)
* [surfingkeys](https://addons.mozilla.org/ru/firefox/addon/surfingkeys_ff/) + load settings from [this gist](https://gist.githubusercontent.com/vyorkin/c5d9cfa63da9811ed0062c5f1440f754/raw/12742b47426899547467eadef09ba8e9d56b3ce3/surfingkeys.txt)
* [tab suspender](https://addons.mozilla.org/ru/firefox/addon/ff-tab-suspender/) + set timeout to 720 seconds or more
* [one tab](https://addons.mozilla.org/ru/firefox/addon/onetab/)
* [tree style tab](https://addons.mozilla.org/ru/firefox/addon/tree-style-tab/)
* [bookmark tree style tab](https://addons.mozilla.org/ru/firefox/addon/bookmark-tree-for-tst/)
* [https everywhere](https://addons.mozilla.org/ru/firefox/addon/https-everywhere/)
* [grammarly](https://addons.mozilla.org/en-US/firefox/addon/grammarly-1/)
* [dark reader](https://addons.mozilla.org/ru/firefox/addon/darkreader/)
* [nosquint plus](https://addons.mozilla.org/en-US/firefox/addon/nosquint-plus/)
* [refined github](https://addons.mozilla.org/en-US/firefox/addon/refined-github-/)
* [octotree](https://addons.mozilla.org/ru/firefox/addon/octotree/) + set `Hotkeys` to `tab`
* [dictionary-anywhere](https://addons.mozilla.org/en-US/firefox/addon/dictionary-anywhere/?src=userprofile)
* [cookie autodelete](https://addons.mozilla.org/ru/firefox/addon/cookie-autodelete/)
* [merge-all-windows](https://addons.mozilla.org/en-US/firefox/addon/merge-window/)
* [gnome-shell-integration/](https://addons.mozilla.org/en-US/firefox/addon/gnome-shell-integration/) (for GNOME)

### GitHub

* `gist --login`

### Other

* `tldr --update`

### Links

* [wiedzmin/nixos-config](https://github.com/wiedzmin/nixos-config.git)
* [rummik/nixos-config](https://github.com/rummik/nixos-config)
* [danieldk/nix-home](https://github.com/danieldk/nix-home)
