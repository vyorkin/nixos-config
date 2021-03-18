{ pkgs, ... }:

let
  psc-package2nix = import (pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "psc-package2nix";
    rev = "f271b3ad7a8e2931a50b03dafd906262679d527f";
    sha256 = "1D4Nxny/XPBuM8bopxSRbMhLdG0JwFzjwVKEVEoCHzc=";
  }) { inherit pkgs; };
in {
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
    niv
    appimage-run

    # Generators

    nodePackages.node2nix
    nodePackages.bower2nix
    cabal2nix
    psc-package2nix
    # stack2nix
  ];
}
