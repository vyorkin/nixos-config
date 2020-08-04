{ pkgs, ... }:

let bumblebeeStatus = pkgs.callPackage ../pkgs/custom/bumblebee-status { };
in {
  sound.mediaKeys.enable = true;
  # I use Home Manager to manage X session

  services.xserver = {
    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      configFile = ../home/dotfiles/i3/config;
      extraSessionCommands = ''
        xrdb -merge -I$HOME ~/.Xresources

        autorandr -c
        nm-applet &
        blueman-applet &
        pasystray &
        dunst &
        flameshot &
        unclutter &

        xset r rate 300 65
      '';

      extraPackages = with pkgs; [
        bumblebeeStatus
        unclutter
        # i3lock
        # i3lock-color
        # i3lock-fancy
        i3lock-pixeled
        # betterlockscreen
        # i3status-rust
        # i3-wk-switch

        gnome3.nautilus
        gnome3.sushi
        gnome3.dconf
      ];
    };

    displayManager.sddm.enable = true;
    desktopManager.plasma5.enable = true;
  };
}
