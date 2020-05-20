{ pkgs, ... }:

# let
#   nixfmt = import ../../pkgs/custom/nixfmt;
{
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
    cachix

    nix-bash-completions
    nix-zsh-completions

    nixfmt
  ];
}
