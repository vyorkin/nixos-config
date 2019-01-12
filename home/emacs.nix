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

  # see: https://github.com/rycee/home-manager/issues/299
  # wait for: https://github.com/rycee/home-manager/pull/517/
  systemd.user.services.emacs-daemon = {
    Unit = {
      Description = "Emacs text editor";
      Documentation = "info:emacs man:emacs(1) https://gnu.org/software/emacs/";
    };
    Service = {
      Type = "forking";
      ExecStart = "${pkgs.stdenv.shell} -l -c 'exec /run/current-system/sw/bin/emacs --daemon'";
      ExecStop = "/run/current-system/sw/bin/emacsclient --eval '(kill-emacs)'";
      Restart = "on-failure";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
