{ pkgs, ... }:

let
  bumblebeeStatus = pkgs.callPackage ../pkgs/bumblebee-status {};
in
  {
    imports = [
      ./rofi.nix
      ./dunst.nix
      ./twmn.nix
    ];

    xsession = {
      enable = true;

      windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps;
        config = null;
        extraConfig = builtins.readFile ./dotfiles/i3/config;
      };

      initExtra = ''
      xrdb -merge -I$HOME ~/.Xresources
      xbindkeys

      xidlehook --not-when-audio --not-when-fullscreen\
        --timer normal 150 'notify-send -t 7000 -u critical "Locking in 30 seconds"' ''' \
        --timer primary 30 'i3lock-pixeled' ''' &

      '';
    };

    home.packages = with pkgs; [
      bumblebeeStatus
      unclutter
      i3lock-color
      i3lock-fancy
      i3lock-pixeled
      i3status-rust
    ];

    home.file = {
      "i3" = {
        source = ./dotfiles/i3/lock.png;
        target = ".config/i3/lock.png";
      };
    };
  }
