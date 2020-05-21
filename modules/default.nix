{ lib, ... }:

with lib;
with types; {
  imports = [
    ./secrets.nix
  ];

  options = {
    host = mkOption { type = str; };
  };
}
