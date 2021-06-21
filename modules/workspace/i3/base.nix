{ pkgs, lib, config, ... }:

let
  cfg = import ./config/base.nix { inherit pkgs lib config; };
  env = import ./config/env.nix { };
in {
  services.xserver = {
    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      configFile = ./config/native;
    };
  };

  environment.systemPackages = with pkgs; [
    xrandr-invert-colors
    dmenu
    nitrogen
    rofi
    dunst
    betterlockscreen
    i3lock-pixeled
  ];

  home-manager.users.vyorkin = {
    home.file = {
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
