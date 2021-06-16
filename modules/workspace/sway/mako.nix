{ pkgs, ... }:

{
  home-manager.users.vyorkin = {
    wayland.windowManager.sway.config.startup = [{ command = "mako"; }];
    programs.mako = {
      enable = true;
      layer = "overlay";
      font = "IBM Plex 13";
      width = 500;
      height = 80;
      defaultTimeout = 10000;
      maxVisible = 10;
      backgroundColor = "#000000AA";
      textColor = "#FFFFFF";
      borderColor = "#444444AA";
      progressColor = "over #11AA11";
      iconPath = "${pkgs.papirus-icon-theme}/share/icons/Papirus-Dark";
      maxIconSize = 24;
    };
  };
}
