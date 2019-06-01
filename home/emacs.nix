{ pkgs, ... }:

{
  home-manager.users.vyorkin = {
    home.file = {
      "purescript-mode" = {
        source = ./dotfiles/emacs/purescript-mode;
        target = ".emacs.d/purescript-mode";
      };

      "PG" = {
        source = ./dotfiles/emacs/lisp/PG;
        target = ".emacs.d/lisp/PG";
      };

      "yasnippet-snippets" = {
        source = ./dotfiles/emacs/yasnippet-snippets;
        target = ".emacs.d/yasnippet-snippets";
      };
    };
  };
}
