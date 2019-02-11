{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; with ocamlPackages; [
    ocaml
    opam
    findlib
    utop
    merlin
  # tuareg
    reason
    ocp-indent
  ];
}
