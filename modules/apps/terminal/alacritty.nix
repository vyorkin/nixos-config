{ config, pkgs, lib, ... }:

{
  home-manager.users.vyorkin.programs.alacritty = {
    enable = true;
    settings = {

      font = rec {
        normal.family = config.themes.fonts.mono.family;
        size = config.themes.fonts.mono.size;
        bold = { style = "Bold"; };
      };

      window.padding = {
        x = 4;
        y = 10;
      };

      shell.program = "${pkgs.zsh}/bin/zsh";

      cursor.style = "Block";

      live_config_reload = true;

      background_opacity = 0.9;

      colors = with pkgs.my.thmHash; {
        primary = {
          background = base00;
          foreground = base05;
        };
        cursor = {
          text = base02;
          cursor = base00;
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
