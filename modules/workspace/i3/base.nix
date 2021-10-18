{ pkgs, inputs, lib, config, ... }:

let
  cfg = import ./config/base.nix { inherit pkgs lib config; };
  env = import ./config/env.nix { };
  scripts = import ./scripts pkgs config;
in {
  services.xserver = {
    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      configFile = ./config/native;
      extraPackages = with pkgs; [
        i3status
        i3blocks
        xrandr-invert-colors
        dmenu
        nitrogen
        rofi
        dunst
        betterlockscreen
        i3lock-pixeled
      ];
    };
  };

  # It seems that i3blocks read it's contents from a hardcoded path in /etc by default.
  # Since in nixos, this path look something like: 
  # /nix/store/k78nc1bplhy4yjblqwlc14h6rdisix3w-i3blocks-1.4/libexec/i3blocks/[BLOCKS]
  # So we have to create a link to this path by adding this line:
  environment.pathsToLink = [ "/libexec" ];

  services.compton.enable = true;

  home-manager.users.vyorkin = {
    home.file = {
      "i3blocks-contrib" = {
        source = inputs.i3blocks-contrib;
        target = ".config/i3blocks-contrib";
      };
      "i3blocks-custom" = {
        source = ./config/blocks;
        target = ".config/i3blocks-custom";
      };
      "i3blocks" = {
        source = ./config/i3blocks.conf;
        target = ".i3blocks.conf";
      };
      ".compton.conf" = { source = ./compton.conf; };
      "dunst" = {
        source = ./dunst;
        target = ".config/dunst";
        recursive = true;
      };
      "rofi" = {
        source = ./rofi;
        target = ".config/rofi";
      };
    };
  };
}
