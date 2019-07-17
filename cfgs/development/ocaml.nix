{ pkgs, ... }:

let
  ocamlVersion = (builtins.parseDrvName pkgs.ocamlPackages.ocaml.name).version;
in
  {
    environment.systemPackages = with pkgs; [
      ocaml
    ] ++
    (with pkgs.ocamlPackages; [
      ocamlbuild
      opam
      findlib
      batteries
      utop
      merlin
      reason
      camlp5
      num
      ocp-indent
      core
      core_extended
      eliom
      async
      js_of_ocaml
      js_of_ocaml-ppx
    ]);

    # environment.variables = {
    #   findlib = "${pkgs.ocamlPackages.findlib}/lib/ocaml/${ocamlVersion}/site-lib";
    # };
  }
