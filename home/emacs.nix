{ pkgs, ... }:

{
  home-manager.users.vyorkin = {
    home.file = {
      "setup.el" = {
        source = ./dotfiles/emacs/setup.el;
        target = ".emacs.d/setup.el";
      };

      "init.org" = {
        source = ./dotfiles/emacs/init.org;
        target = ".emacs.d/init.org";
      };

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
