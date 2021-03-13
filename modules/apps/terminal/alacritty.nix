{ config, pkgs, lib, ... }:
let theme = config.themes.colors;
in {
  home-manager.users.vyorkin.programs.alacritty = {
    enable = true;
    settings = {

      font = rec {
        normal.family = "JetBrains Mono";
        size = 12;
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

      colors = {
        primary = {
          background = theme.bg;
          foreground = theme.fg;
        };
        cursor = {
          text = theme.alt;
          cursor = theme.fg;
        };
        normal = {
          black = theme.bg;
          inherit (theme) red green yellow blue cyan;
          magenta = theme.purple;
          white = theme.fg;
        };
      };
    };
  };

}
