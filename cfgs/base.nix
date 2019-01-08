{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pkgconfig
    nix-prefetch-scripts
    nix-prefetch-github
    nix-du
    nix-index
    nix-serve
    nixops

    nix-bash-completions
    nix-zsh-completions

    tree
    parted
    binutils
    gcc
    gnumake
    openssl

    telnet

    bat
    ncdu

    xorg.xinput
    xorg.xset
    xorg.setxkbmap
    xorg.xmodmap
    xcape
    xclip
  ];
}
