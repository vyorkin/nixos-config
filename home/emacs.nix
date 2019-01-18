{ pkgs, ... }:

{
  home.file = {
    "init.el" = {
      source = ./dotfiles/emacs/init.el;
      target = ".emacs.d/init.el";
    };

    "abbrev_defs" = {
      source = ./dotfiles/emacs/abbrev_defs;
      target = ".emacs.d/abbrev_defs";
    };

    "opam-user-setup.el" = {
      source = ./dotfiles/emacs/opam-user-setup.el;
      target = ".emacs.d/opam-user-setup.el";
    };

    "features" = {
      source = ./dotfiles/emacs/features;
      target = ".emacs.d/features";
    };

    "images" = {
      source = ./dotfiles/emacs/images;
      target = ".emacs.d/images";
    };

    "yasnippet-snippets" = {
      source = ./dotfiles/emacs/yasnippet-snippets;
      target = ".emacs.d/yasnippet-snippets";
    };
  };
}
