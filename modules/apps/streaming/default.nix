{ pkgs, ... }:

{
  home-manager.users.vyorkin = {
    programs.obs-studio = {
      enable = true;
      package = pkgs.obs-studio;
      plugins = [ pkgs.obs-wlrobs ];
    };
  };
}
