{ pkgs, ... }:

{
  imports = [
    ./kernel.nix
    ./ccpp.nix
    ./lisp.nix
    ./clojure.nix
    ./formalization.nix
    # ./purescript.nix
    ./python.nix
    ./ruby.nix
    # ./nodejs
    ./rust.nix
    ./tcl.nix
    ./go.nix
    ./haskell
    ./ocaml
    # ./agda.nix
    ./java.nix
    ./arduino.nix
  ];

  environment.systemPackages = with pkgs; [
    universal-ctags
    buck
    cloc
    sloccount
    shellcheck
    global
    highlight
    sourceHighlight
    hyperfine
    weighttp
    xxd
    direnv
    asciinema
    exercism

    bison
    flex
    llvm_9

    rakudo

    dhall
    dhall-bash
    dhall-json
    # dhall-nix
    # dhall-text

    elixir
    idris
    nim
    racket
    swiProlog
    # mercury

    ats
    ats2

    gnuapl
    j

    # octave
    # julia

    # hydra
  ];
}
