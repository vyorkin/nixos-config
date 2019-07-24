{ pkgs, ... }:

let
  nixfmt = import ../../pkgs/custom/nixfmt;
in {
  environment.systemPackages = with pkgs; [
    pkgconfig
    nix-prefetch-scripts
    nix-prefetch-github
    nix-du
    nix-index
    nix-serve
    nix-review
    # nixops
    any-nix-shell

    nix-bash-completions
    nix-zsh-completions

    nixfmt
  ];
}
