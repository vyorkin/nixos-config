## NixOS config for my machines

### Prerequisites

Make sure you have `git` installed:

```sh
$ nix profile install git
```

### Setup

1. Backup your original config

```sh
mv /etc/nixos /etc/nixos-orig
```

2. Clone this repository and create a symlink to `/etc/nixos`

```sh
mkdir -p ~/projects/personal && cd ~/projects/personal
git clone --recurse-submodules -j8 --depth=1 https://github.com/vyorkin/nixos-config
ln -sf nixos-config /etc/nixos
```

3. Add your new host configuration files to `hardware/yourhost/*.nix`

4. Set `hostname` to the desired one

```sh
hostname yourhostname
```

5.

Edit `const.nix` and add **your** `secrets` input to registry:

```sh
sudo nix flake add secrets git+ssh://foo/bar.git
```

(If you’re me then take a look at the dotsecrets README.md)

Then configure the NixOS machine:


```sh
sudo nixos-rebuild switch --flake .
```

### Layout

- `default.nix` - Configuration “entry point”
- `flake.nix` - Metadata describing this repository
- `setup.nix` - System and Nix related configuration
- `support.nix` - Utility functions
- `secret.nix` - Contains secrets ;)
- `const.nix` - Various constants
- `hardware/` - Host specific hardware configurations
- `hosts/` - Host specific configurations
- `cfgs/` - Package configurations
- `roles/` - Shared configurations
- `home/` - Home-manager configurations
- `pkgs/` - Local/custom derivations

### Notes for myself

Manual symlinks (on `shelter`):

* `/files/Dropbox/Documents -> ~/Documents`
* `/files/projects -> ~/projects`
* `/files/Downloads -> ~/Downloads`

* Copy `ssh` folder from the dotsecrets repo to the `~/.ssh`.
* Fix permissions for `ssh` folder: `chmod 700 -R ~/.ssh`

### Haskell

Tools:

* [stack2nix](https://github.com/input-output-hk/stack2nix)
* [all-hies](https://github.com/Infinisil/all-hies)
* [Komposition](https://owickstrom.github.io/komposition/user-guide/installation/)

### Nix

Lorri: https://github.com/target/lorri/blob/master/contrib/daemon.md

### Rust

```bash
$ rustup toolchain add nightly
$ rustup default nightly
$ rustup component add rust-src
$ cargo install bingrep
$ cargo install rusty-tags
$ rustup component add rustfmt-preview --toolchain nightly
$ cargo +nightly install racer
$ cargo install bootimage cargo-xbuild
$ cargo install hunter navi
```

### Go

* `gitbatch` - allows manage your git repositories in one place

```bash
go get -u github.com/isacikgoz/gitbatch/cmd/gitbatch
```

### Why3

```bash
why3 config --detect
```

### MiniZinc

Edit the `gecode.msc` and update the `fzn-gecode`.
To find the path:

```sh
readlink -f $(which fzn-gecode)
```

### OCaml

Remove `OCAML_TOPLEVEL_PATH` from `~/.opam/opam-init/variables.sh`

### Coq

```sh
opam repo add coq-released https://coq.inria.fr/opam/released
opam update
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
* [module-linker](https://addons.mozilla.org/en-US/firefox/addon/module-linker/)
* [octotree](https://addons.mozilla.org/ru/firefox/addon/octotree/) + set `Hotkeys` to `tab`
* [dictionary-anywhere](https://addons.mozilla.org/en-US/firefox/addon/dictionary-anywhere/?src=userprofile)
* [cookie autodelete](https://addons.mozilla.org/ru/firefox/addon/cookie-autodelete/)
* [merge-all-windows](https://addons.mozilla.org/en-US/firefox/addon/merge-window/)
* [gnome-shell-integration/](https://addons.mozilla.org/en-US/firefox/addon/gnome-shell-integration/) (for GNOME)

### GitHub

* `gist --login`

### Other

* `tldr --update`

### Inspired by

* [wiedzmin/nixos-config](https://github.com/wiedzmin/nixos-config.git)
* [balsoft/nixos-config](https://github.com/balsoft/nixos-config)
* [rasendubi/dotfiles](https://github.com/rasendubi/dotfiles)
