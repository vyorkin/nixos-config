{ pkgs, lib, config, ... }:

{
  environment.systemPackages = with pkgs; [
    # Allows to bind commands to certain keys or key
    # combinations on the keyboard
    xbindkeys

    # GUI for xbindkeys
    xbindkeys-config
  ];

  home-manager.users.vyorkin = {
    home.file = {
      ".xbindkeysrc" = { source = ./xbindkeysrc; };
    };
  };
}
