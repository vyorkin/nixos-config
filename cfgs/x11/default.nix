{ pkgs, ... }:

let
  layoutContent = builtins.readFile ./layout.xkb;
  layoutPath = builtins.toFile "layout.xkb" layoutContent;
  compiledLayout = pkgs.runCommand "keyboard-layout" {} ''
    ${pkgs.xorg.xkbcomp}/bin/xkbcomp ${layoutPath} $out
  '';
in {
  imports = [./packages.nix];

  services.xserver.displayManager.sessionCommands =
    "${pkgs.xorg.xkbcomp}/bin/xkbcomp ${layoutPath} $DISPLAY";
  }
