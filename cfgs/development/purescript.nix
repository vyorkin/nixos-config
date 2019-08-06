{ pkgs, ... }:

let
  # import the remote nix expression
  easy-purescript = import (pkgs.fetchgit {
    url = "https://github.com/justinwoo/easy-purescript-nix.git";
    rev = "e3501174123c884d5878b42a48e361aa113cdead";
    sha256 = "1c28ml262qnh7c1rsz86gnmrj9k9gi35rxh2mx1mwr2ac5dl213a";
  });
in {
  environment.systemPackages = with easy-purescript.inputs; [
    purs
    psc-package
    purp
    spago
    zephyr
    pscid
  ];
}
