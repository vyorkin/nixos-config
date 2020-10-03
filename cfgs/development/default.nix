{ pkgs, ... }:

{
  imports = [
    ./kernel.nix
    ./ccpp.nix
    ./lisp.nix
    # ./clojure.nix
    ./formalization.nix
    # ./purescript.nix
    ./python.nix
    ./ruby.nix
    ./nodejs
    ./rust.nix
    # ./tcl.nix
    ./go.nix
    ./haskell
    ./ocaml
    ./sml.nix
    ./agda.nix
    ./java.nix
    ./wordpress.nix
    ./arduino.nix
    ./kafka.nix
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

    flamegraph
    gdb
    gdbgui
    renderdoc

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
    idris2

    nim
    racket
    swiProlog
    # mercury

    # Logic Defined Static Analysis
    souffle

    ats
    ats2

    gnuapl
    j

    # octave
    # julia

    # hydra
  ];
}
