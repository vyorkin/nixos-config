{ config, ... }:

{
  home-manager.users.vyorkin = {
    xresources.properties = with config.themes.colors; {
      "*background" = bg;
      "*foreground" = fg;
      "*color0" = dark;
      "*color1" = orange;
      "*color2" = green;
      "*color3" = yellow;
      "*color4" = blue;
      "*color5" = purple;
      "*color6" = cyan;
      "*color7" = fg;
      "*color8" = dark;
      "*color9" = orange;
      "*color10" = green;
      "*color11" = yellow;
      "*color12" = blue;
      "*color13" = purple;
      "*color14" = cyan;
      "*color15" = fg;

      "emacs.font" = "JetBrains Mono 12";
    };
  };
}
