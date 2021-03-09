## NixOS config for my hosts

### Setup

1. Backup your original config

```sh
sudo mv /etc/nixos /etc/nixos-orig
```

2. Clone this repository and create a symlink to `/etc/nixos`

```sh
mkdir -p ~/projects/personal && cd ~/projects/personal
git clone --recurse-submodules -j8 --depth=1 https://github.com/vyorkin/nixos-config
ln -sf nixos-config /etc/nixos
```

3. (Optional) Add your new host configuration files to
   `hosts/yourhost/*` and add the corresponding target to `Makefile`.

4. Build and deploy the NixOS host:


```sh
make setup/yourhost
```

### Layout

- `Makefile` - Contains targets to build host systems
- `flakes.nix` - Metadata describing this repository
- `hosts/` - Host specific configurations
- `modules/` - Package configurations
- `profiles/` - Profiles (server, desktop)
- `packages/` - Local/custom derivations

### Haskell

Tools:

* [stack2nix](https://github.com/input-output-hk/stack2nix)
* [all-hies](https://github.com/Infinisil/all-hies)
* [Komposition](https://owickstrom.github.io/komposition/user-guide/installation/)

### Nix

Lorri: https://github.com/target/lorri/blob/master/contrib/daemon.md

### Vim/NeoVim

#### OCaml

Note that you need to run:

```vimscript
:execute "helptags " . substitute(system('opam config var share'),'\n$','','''') .  "/merlin/vim/doc"
```

to manually to update the documentation

### NodeJS

Enable the workaround to be able to install node packages globally.
Make sure to create the following directory:

```bash
$ mkdir ~/.npm-packages
```

This directory is used in the `~/.npmrc`.

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
$ cargo install elba hunter navi
```

### Go

* `gitbatch` - allows manage your git repositories in one place

```bash
$ go get -u github.com/isacikgoz/gitbatch/cmd/gitbatch
```

### TypeScript

```bash
$ npm i -g typescript typescript-formatter microsoft@rush npm-check-updates
```

### Why3

```bash
$ why3 config --detect
```

### MiniZinc

Edit the `gecode.msc` and update the `fzn-gecode`.
To find the path:

```sh
$ readlink -f $(which fzn-gecode)
```

### OCaml

Remove `OCAML_TOPLEVEL_PATH` from `~/.opam/opam-init/variables.sh`

```
opam repo add beta https://github.com/ocaml/ocaml-beta-repository.git
```

Install tools and common/core packages:

```
opam install tuareg merlin ocp-indent odoc
opam pin add ocaml-lsp-server https://github.com/ocaml/ocaml-lsp.git
opam install ocaml-lsp-server

opam install core core_bench stdio ppx_deriving ppx_inline_test ppx_expect
opam install fmt cmdliner lwt js_of_ocaml logs textutils
opam install alcotest qcheck qcheck-alcotest
```

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

* [bypass paywills](https://github.com/iamadamdev/bypass-paywalls-chrome)
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

* [balsoft/nixos-config](https://github.com/balsoft/nixos-config)
* [wiedzmin/nixos-config](https://github.com/wiedzmin/nixos-config.git)
