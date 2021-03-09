{ pkgs, config, ... }:

let
  theme = config.themes.colors;
in {
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
      backgroundColor = "${theme.bg}AA";
      textColor = theme.fg;
      borderColor = "${theme.blue}AA";
      progressColor = "over ${theme.green}";
      iconPath = "${pkgs.papirus-icon-theme}/share/icons/Papirus-Dark";
      maxIconSize = 24;
    };
  };
}
