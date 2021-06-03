{ pkgs, lib, config, ... }:

let
  cfg = import ./config/base.nix { };
  env = import ./config/env.nix { };
in {
  home-manager.users.vyorkin.xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
  };
}
