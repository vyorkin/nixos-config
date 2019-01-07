{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs.zsh.zplug;
  pkg = (pkgs.callPackage ../pkgs/zplug/default.nix { });
in
  {
    options = {
      programs.zsh.zplug = {
        enable = mkOption {
          default = false;
          description = "Enable zplug.";
        };
      };
    };

    config = mkIf cfg.enable {
      environment.systemPackages = [ pkg ];

      programs.zsh.interactiveShellInit = mkBefore(with builtins; ''
        export ZPLUG_HOME=${pkg}/share/zplug
      '');
    };
  }
