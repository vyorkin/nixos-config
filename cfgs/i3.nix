{ pkgs, ... }:

let bumblebeeStatus = pkgs.callPackage ../pkgs/custom/bumblebee-status { };
in {
  sound.mediaKeys.enable = true;
  # I use Home Manager to manage X session

  # security.pam.services.sddm.enableKwallet = true;

  services.xserver = {
    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      configFile = ../home/dotfiles/i3/config;
      extraSessionCommands = ''
        xrdb -merge -I$HOME ~/.Xresources
        dunst &
      '';

      # TODO: Start dunst service properly (by using services.dunst)

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

    displayManager = {
      # defaultSession = "none+i3";
      # lightdm = {
      #   enable = true;
      #   greeters.mini = {
      #     enable = true;
      #     user = "vyorkin";
      #   };
      # };
      job = {
        logToFile = true;
        logToJournal = true;
      };
    };
  };
}
