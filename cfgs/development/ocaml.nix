{ pkgs, ... }:

let
  ocamlVersion = (builtins.parseDrvName pkgs.ocamlPackages.ocaml.name).version;
  siteLisp = "share/emacs/site-lisp";
  globalPkgs = with pkgs.ocamlPackages; [
    ocamlbuild
    findlib
    batteries
    utop
    merlin
    reason
    camlp5
    num
    ocp-indent
    ocp-index
    odoc
    core
    core_kernel
    core_extended
    core_bench
    eliom
    async
    js_of_ocaml
    js_of_ocaml-ppx
  ];
in {
  environment.systemPackages = with pkgs; [ ocaml opam dune ] ++ globalPkgs;
  environment.variables = with pkgs.ocamlPackages; {
    OCAML_IN_EMACS = "1";
    UTOP_SITE_LISP = "${utop}/${siteLisp}";
    MERLIN_SITE_LISP = "${merlin}/${siteLisp}";
    OCP_INDENT_SITE_LISP = "${ocp-indent}/${siteLisp}";
  };
}
