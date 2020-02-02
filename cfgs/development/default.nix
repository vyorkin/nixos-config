{ pkgs, ... }:

{
  imports = [
    ./ccpp.nix
    ./lisp.nix
    ./clojure.nix
    ./formalization.nix
    ./purescript.nix
    ./python.nix
    ./ruby.nix
    ./nodejs
    ./rust.nix
    ./tcl.nix
    ./go.nix
    ./haskell
    ./ocaml
    ./agda.nix
    ./java.nix
    ./arduino.nix
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

    rakudo

    elixir
    idris
    nim
    racket
    swiProlog
    mercury
    # ats
    ats2

    gnuapl
    j

    # octave
    julia

    # hydra
  ];
}