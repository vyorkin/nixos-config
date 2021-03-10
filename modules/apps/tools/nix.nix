{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cachix

    nix-prefetch-scripts
    nix-prefetch-github
    nixfmt
    nix-du
    nix-index
    nix-serve
    nix-review
    nix-top
    any-nix-shell
  ];
}
