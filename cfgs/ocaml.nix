{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; with ocamlPackages; [
    ocaml
    ocamlbuild
    eliom
    opam
    findlib
    utop
    merlin
  # tuareg
    reason
    ocp-indent
  ];
}
