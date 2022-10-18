{ config, pkgs, lib, ... }:

{
  home-manager.users.vyorkin.programs.alacritty = {
    enable = true;
    settings = {

      font = rec {
        normal.family = config.themes.fonts.mono.family;
        size = 10;
        bold = { style = "Bold"; };
      };

      window = {
        opacity = 0.9;
        padding = {
          x = 4;
          y = 4;
        };
        decorations = "none";
      };

      shell.program = "${pkgs.zsh}/bin/zsh";

      cursor.style = "Underline";

      live_config_reload = true;

      colors = with pkgs.my.thmHash; {
        primary = {
          background = base00;
          foreground = base05;
        };
        cursor = {
          text = base00;
          cursor = base0E;
        };
        normal = {
          black = base00;
          red = base08;
          green = base0B;
          yellow = base0A;
          blue = base0D;
          magenta = base0E;
          white = base07;
        };
      };
    };
  };

}
