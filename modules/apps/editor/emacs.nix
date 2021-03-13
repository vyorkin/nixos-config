{ pkgs, ... }:

{
  home-manager.users.vyorkin = {
    programs.emacs = {
      enable = true;
      package = pkgs.emacsPgtk;
    };

    systemd.user.services.emacs.Service.Environment =
      "PATH=/run/current-system/sw/bin:/etc/profiles/per-user/vyorkin/bin";
  };
}
