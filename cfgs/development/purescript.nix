{ pkgs, ... }:

let
  # import the remote nix expression
  easy-purescript = import (pkgs.fetchgit {
    url = "https://github.com/justinwoo/easy-purescript-nix.git";
    rev = "e3501174123c884d5878b42a48e361aa113cdead";
    sha256 = "1c28ml262qnh7c1rsz86gnmrj9k9gi35rxh2mx1mwr2ac5dl213a";

    # url = "https://github.com/vyorkin-forks/easy-purescript-nix.git";
    # rev = "fd36c21e5d3941b497a5e4988f5e50f761f173ad";
    # sha256 = "11x53f5qvd7s8b37hhbwhpsz613cqm5k3nzm1ym0zxam9kv1apb1";
  });
in {
  environment.systemPackages = with easy-purescript.inputs; [
    purs
    psc-package
    purp
    psc-package2nix
    spago
    zephyr
    pscid
  ];
}
