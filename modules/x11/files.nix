{ pkgs, ... }:

{
  home-manager.users.vyorkin = {
    home.file = {
      ".Xmodmap" = { source = ./Xmodmap; };
      "autorandr" = {
        source = ./autorandr;
        target = ".config/autorandr";
      };
    };
  };
}
