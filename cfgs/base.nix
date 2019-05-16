{ pkgs, ... }:

let
  nixfmt = import ../pkgs/custom/nixfmt;
in {
  environment.systemPackages = with pkgs; [
    pkgconfig
    nix-prefetch-scripts
    nix-prefetch-github
    nix-du
    nix-index
    nix-serve
    # nixops
    any-nix-shell

    nix-bash-completions
    nix-zsh-completions

    nixfmt

    tree
    parted
    binutils
    gcc
    gnumake
    openssl

    telnet

    screenfetch
    bat
    exa
    ncdu
  ];
}
