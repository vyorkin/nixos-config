{ pkgs, ... }:

{
  home-manager.users.vyorkin = {
    programs.emacs = {
      enable = true;
      package = pkgs.emacsPgtk;
    };

    services.emacs = {
      enable = true;
      package = pkgs.emacsPgtk;
    };

    home.packages = with pkgs; [
      ispell
    ];

    systemd.user.services.emacs.Service.Environment =
      "PATH=/run/current-system/sw/bin:/etc/profiles/per-user/vyorkin/bin";
  };
}
