{ pkgs, ... }:

let
  # oldNixPkgs = pkgs.fetchFromGitHub {
  #   owner = "NixOS";
  #   repo = "nixpkgs";
  #   rev = "8070a6333f3fc41ef93c2b0e07f999459615cc8d";
  #   sha256 = "0v6nycl7lzr1kdsy151j10ywhxvlb4dg82h55hpjs1dxjamms9i3";
  # };
  # oldPkgs = import oldNixPkgs { };

  # I use opam for managing global / per-switch Coq packages instead
  coqPkgs = with pkgs.coqPackages; [
    # ssreflect
    # mathcomp
    # mathcomp-ssreflect
    # mathcomp-analysis
    # mathcomp-algebra
    # QuickChick
    # coq-ext-lib
    # category-theory
    # coq-haskell
  ];
in {
  environment.systemPackages = with pkgs; [
    # coq package in the nixpkgs is ancient, so
    # I usually just install it with opam instead
    # coq
    # prooftree

    # oldPkgs.z3
    cvc4

    tlaplus
    tlaplusToolbox

    minizinc
    minizincide

    why3
    alt-ergo
    framac
    gecode
    isabelle
    alloy
  ] ++ coqPkgs;
}
