{ pkgs, lib, config, ... }:

{
  environment.systemPackages = with pkgs; [
    # Allows to bind commands to certain keys or key
    # combinations on the keyboard
    xbindkeys

    # GUI for xbindkeys
    xbindkeys-config

    xorg.xbacklight
  ];

  # Install Light backlight control command
  programs.light.enable = true;

  home-manager.users.vyorkin = {
    home.file = {
      ".xbindkeysrc" = { source = ./xbindkeysrc; };
    };
  };
}
