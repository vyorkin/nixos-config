{ pkgs, inputs, ... }:

{
  home-manager.users.vyorkin = {
    home.file = {
      "purescript-mode" = {
        source = "${inputs.emacs}/purescript-mode";
        target = ".emacs.d/purescript-mode";
      };

      "PG" = {
        source = "${inputs.emacs}/lisp/PG";
        target = ".emacs.d/lisp/PG";
      };

      "ats-mode" = {
        source = "${inputs.emacs}/lisp/ats-mode.el";
        target = ".emacs.d/lisp/ats-mode.el";
      };

      "yasnippet-snippets" = {
        source = "${inputs.emacs}/yasnippet-snippets";
        target = ".emacs.d/yasnippet-snippets";
      };
    };
  };
}
