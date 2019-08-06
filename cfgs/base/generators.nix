{ pkgs, ... }:

let
  psc-package2nix = import (pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "psc-package2nix";
    rev = "da2368886961e08c5f0b5b3f78aa485fed116d8e";
    sha256 = "05akkd3p9hs03iia9g2swscms7sd0pviflj8rjq1hiak8ajgx6qm";
  }) { inherit pkgs; };
in {
  environment.systemPackages = with pkgs; [
    nodePackages.node2nix
    nodePackages.bower2nix
    cabal2nix
    psc-package2nix
    # stack2nix
  ];
}
