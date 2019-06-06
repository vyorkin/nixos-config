{ pkgs, ... }:

{
  imports = [
    ./ccpp.nix
    ./js.nix
    ./lisp.nix
    ./ocaml.nix
    ./proof-assistants.nix
    ./purescript.nix
    ./python.nix
    ./ruby.nix
    ./rust.nix
    ./tcl.nix
    ./haskell
  ];

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
