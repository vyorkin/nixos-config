{ pkgs, ... }:

{
  home-manager.users.vyorkin = {
    programs.obs-studio = {
      enable = true;
      package = pkgs.obs-studio;

      # Only needed for Wayland
      # plugins = [ pkgs.obs-wlrobs ];
    };
  };
}
