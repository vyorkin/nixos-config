{ pkgs, ... }:

{
  home-manager.users.vyorkin = {
    home.file = {
      ".Xmodmap" = { source = ./dotfiles/Xmodmap; };
      ".Xresources" = { source = ./dotfiles/Xresources; };
      ".compton.conf" = { source = ./dotfiles/compton.conf; };
      ".inputrc" = { source = ./dotfiles/inputrc; };
      ".xbindkeysrc" = { source = ./dotfiles/xbindkeysrc; };
      ".xprofile" = { source = ./dotfiles/xprofile; };
    };
  };
}
