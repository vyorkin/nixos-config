{ pkgs, lib, ... }:
{
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
          background = "#000000";
          foreground = "#FFFFFF";
        };
        cursor = {
          text = "#111111";
          cursor = "#FFFFFF";
        };
        normal = {
          black = "#000000";
          red = "#FF0000";
          green = "#22BC22";
          yellow = "#FFFF00";
          blue = "#0000FF";
          cyan = "#00FFFF";
          magenta = "#FF00FF";
          white = "#FFFFFF";
        };
      };
    };
  };

}
