{ pkgs, ... }:

let
  ocamlPackages = pkgs.recurseIntoAttrs pkgs.ocamlPackages_latest;
  ocamlVersion = (builtins.parseDrvName ocamlPackages.ocaml.name).version;
in
  {
    environment.systemPackages = with pkgs; [
      ocaml
    ] ++
    (with ocamlPackages; [
      ocamlbuild
      opam
      findlib
      utop
      merlin
      reason
      ocp-indent
      core
      core_extended
      eliom
      async
      js_of_ocaml
      js_of_ocaml-ppx
    ]);

    environment.variables = {
      findlib = "${ocamlPackages.findlib}/lib/ocaml/${ocamlVersion}/site-lib";
    };
  }
