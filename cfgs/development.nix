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

    elixir
    go
    # idris
    nim
    racket
    swiProlog

  # hydra
  ];
}
