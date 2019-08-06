{ pkgs, ... }:

{
  imports = [
    ./ccpp.nix
    ./lisp.nix
    ./formalization.nix
    ./purescript.nix
    ./python.nix
    ./ruby.nix
    ./nodejs
    ./rust.nix
    ./tcl.nix
    ./haskell
    ./ocaml
    ./agda.nix
    ./java.nix
  ];

  environment.systemPackages = with pkgs; [
    buck
    cloc
    sloccount
    shellcheck
    global
    highlight
    hyperfine
    weighttp
    xxd
    direnv
    asciinema
    exercism

    elixir
    go
    idris
    nim
    racket
    swiProlog
    mercury
    ats

    octave

    # hydra
  ];
}
