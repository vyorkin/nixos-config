{ pkgs, ... }:

{
  home-manager.users.vyorkin = {
    programs.obs-studio = {
      enable = true;
      package = pkgs.obs-studio;

      # Wayland-only plugins
      # plugins = [ pkgs.obs-wlrobs ];
    };
  };
}
