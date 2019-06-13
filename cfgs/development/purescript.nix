{ pkgs, ... }:

let
  # import the remote nix expression
  easy-purescript = import (pkgs.fetchgit {
    url = "https://github.com/justinwoo/easy-purescript-nix.git";
    # rev = "0b2c378b360ca0ff92e3fe3a41d191457036b4d6";
    # sha256 = "0q3z494wizbhyz3ifr8kvbcjmi4220nbzksgkhn58300vqiqpa6z";

    # rev = "0debbe629de2c2d6278ba772e40a0851a57b9d2f";
    # sha256 = "1k83gsfgg4p4c2f6ls467fm8v1ixmy1y3jly8id5wc71zc7szs1q";

    rev = "80e6c66c7b5cffefeb823ebebf156d2d7acd3285";
    sha256 = "0npvnr3h4vnq6ibwi9gvxgijyjnwmmyvqglq471wkkn6b4ygry9v";
  });
in {
  environment.systemPackages = with easy-purescript.inputs; [
    purs
    psc-package
    purp
    psc-package2nix
    spago
    zephyr
  ];
}
