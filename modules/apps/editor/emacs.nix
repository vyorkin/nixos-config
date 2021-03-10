{ pkgs, ... }:

{
  home-manager.users.vyorkin = {
    programs.emacs = {
      enable = true;
      package = pkgs.emacsGit;
    };

    services.emacs.enable = true;

    systemd.user.services.emacs.Service.Environment =
      "PATH=/run/current-system/sw/bin:/etc/profiles/per-user/vyorkin/bin";
  };
}
