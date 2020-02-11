{ pkgs, ... }:

let
  opam2nix = import (builtins.fetchTarball
  "https://github.com/timbertson/opam2nix/archive/v1.tar.gz") { };
in {
  environment.systemPackages = with pkgs; [
    ocaml
    opam
    # opam2nix
  ];
}
