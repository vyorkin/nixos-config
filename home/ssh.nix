{ pkgs, ... }:

{
  home.file = {
    ".ssh" = {
      source = ./dotsecrets/ssh;
    };
  };
}
