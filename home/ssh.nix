{ pkgs, ... }:

{


  home.file = {
    ".ssh" = {
      source = ./dotsecrets/ssh;
      recursive = true;
    };
  };
}
