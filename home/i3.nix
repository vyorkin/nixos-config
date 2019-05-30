{ pkgs, ... }:

let bumblebeeStatus = pkgs.callPackage ../pkgs/custom/bumblebee-status { };
in {
  imports = [
    ./rofi.nix
    ./dunst.nix
    ./twmn.nix
  ];

  home-manager.users.vyorkin = {
    home.file."status.toml" = {
      source = ./dotfiles/i3/status.toml;
      target = ".config/i3/status.toml";
    };

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

        autorandr -c
        nm-applet &
        blueman-applet &
        dunst &
        flameshot &
        unclutter &

        xset r rate 300 65
      '';
    };

    home.packages = with pkgs; [
      bumblebeeStatus
      unclutter
      i3lock-color
      i3lock-fancy
      i3lock-pixeled
      i3status-rust

      gnome3.nautilus
      gnome3.sushi
      gnome3.dconf
    ];
  };
}
