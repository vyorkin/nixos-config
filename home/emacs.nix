{ pkgs, ... }:

{
  home.file = {
    "init.el" = {
      source = ./dotfiles/emacs/init.el;
      target = ".emacs.d/init.el";
    };

    "config.org" = {
      source = ./dotfiles/emacs/config.org;
      target = ".emacs.d/config.org";
    };

    "yasnippet-snippets" = {
      source = ./dotfiles/emacs/yasnippet-snippets;
      target = ".emacs.d/yasnippet-snippets";
    };
  };
}
