{ pkgs, ... }:

{
  imports = [
    ./ccpp.nix
    ./lisp.nix
    ./ocaml.nix
    ./formalization.nix
    ./purescript.nix
    ./python.nix
    ./ruby.nix
    ./nodejs
    ./rust.nix
    ./tcl.nix
    ./haskell
    ./agda.nix
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
    asciinema

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
