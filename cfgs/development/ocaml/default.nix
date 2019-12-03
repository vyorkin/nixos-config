{ pkgs, ... }:

let
  opkgs = pkgs.ocamlPackages;
  ocamlVersion = opkgs.ocaml.version;
  globalPkgs = with opkgs; [
    ocamlbuild
    findlib
    utop
    merlin
    ocp-indent
    ocp-index
    # batteries
    # reason
    # camlp5
    # num
    # odoc
    # core
  ];
  mkpath = p: "${p}/lib/ocaml/${ocamlVersion}/site-lib";
  siteLisp = "share/emacs/site-lisp";
in {
  environment.systemPackages = with pkgs; [ ocaml opam dune opaline ] ++ globalPkgs;
  environment.variables = with opkgs; {
    OCAML_IN_EMACS = "1";
    UTOP_SITE_LISP = "${utop}/${siteLisp}";
    MERLIN_SITE_LISP = "${merlin}/${siteLisp}";
    OCP_INDENT_SITE_LISP = "${ocp-indent}/${siteLisp}";
    OCAML_TOPLEVEL_PATH = "${mkpath findlib}";
  };
}
