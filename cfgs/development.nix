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

    go
    # idris
    nim
    racket
    swiProlog

    tcl
    tcllib
    tcltls
    tclx

  # hydra
  ];
}
