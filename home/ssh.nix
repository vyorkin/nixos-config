{ pkgs, ... }:

{
  home-manager.users.vyorkin = {
    home.file = {
      ".ssh" = {
        source = ./dotsecrets/ssh;
        recursive = true;
      };
    };
  };
}
