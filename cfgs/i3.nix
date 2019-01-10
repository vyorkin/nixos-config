{ pkgs, ... }:

let
  bumblebeeStatus = pkgs.callPackage ../pkgs/bumblebee-status {};
in
  {
    environment.systemPackages = with pkgs; [
      bumblebeeStatus
      i3blocks-gaps
      i3status
    ];

    services.xserver = {
      desktopManager = {
        default = "none";
        xterm.enable = false;
      };

      windowManager.i3.package = pkgs.i3-gaps;
      windowManager.i3.enable = true;
    };
  }
