{ pkgs, ... }:

{
  home-manager.users.vyorkin = {
    home.file = {
      ".Xmodmap" = { source = ./Xmodmap; };
    };
  };
}
