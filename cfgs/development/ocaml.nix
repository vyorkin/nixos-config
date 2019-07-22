{ pkgs, ... }:

let
  ocamlVersion = (builtins.parseDrvName pkgs.ocamlPackages.ocaml.name).version;
  siteLisp = "share/emacs/site-lisp";
in with pkgs; {
  environment = {
    systemPackages = [ocaml] ++ (with ocamlPackages; [
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
      core_bench
      eliom
      async
      js_of_ocaml
      js_of_ocaml-ppx
    ]);

    variables = with ocamlPackages; {
      findlib = "${findlib}/lib/ocaml/${ocamlVersion}/site-lib";

      OCAML_IN_EMACS = "1";
      UTOP_SITE_LISP = "${utop}/${siteLisp}";
      MERLIN_SITE_LISP = "${merlin}/${siteLisp}";
      OCP_INDENT_SITE_LISP = "${ocp-indent}/${siteLisp}";
    };
  };
}
