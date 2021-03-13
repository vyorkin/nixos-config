{ pkgs, ... }:

{
  home-manager.users.vyorkin = {
    programs.opam = {
      enable = true;
    };

    home.file = {
      ".utoprc" = { source = ./utoprc; };
      ".ocamlinit" = { source = ./ocamlinit; };
    };
  };
}
