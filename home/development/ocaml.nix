{ ... }:

let basePath = ../dotfiles/ocaml;
in {
  home-manager.users.vyorkin = {
    home.file = { ".ocamlinit" = { source = basePath + "/ocamlinit"; }; };
  };
}
