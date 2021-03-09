{ config, pkgs, lib, ... }:

let
  theme = config.themes.colors;
in {
  home-manager.users.vyorkin.programs.kitty = {
    enable = true;
  };
}
