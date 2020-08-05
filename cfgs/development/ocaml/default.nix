{ pkgs, ... }:

let
  opam2nix = import (builtins.fetchTarball
  "https://github.com/timbertson/opam2nix/archive/v1.tar.gz") { };
  bs-platform-src = pkgs.fetchFromGitHub {
    owner = "turboMaCk";
    repo = "bs-platform.nix";
    rev = "2cbefeb081303f6364f28fcdca750a4453886bc1";
    sha256 = "02axqi00g3w6glwhms8dlb2sg1ac0v7bp9g9cbik0ky3x38fa29b";
  };
in {
  environment.systemPackages = with pkgs; [
    ocaml
    opam
    # opam2nix

    (import bs-platform-src { inherit pkgs; }).bs-platform7
  ];
}
