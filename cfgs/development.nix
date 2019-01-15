{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    buck
    cloc
    sloccount
    global
    highlight
    hyperfine
    weighttp
    xxd
    asciinema

    # idris
    nim
    racket
    swiProlog
    # ocaml
    # opam
    # reason

    tcl
    tcllib
    tcltls
    tclx
  ];
}
