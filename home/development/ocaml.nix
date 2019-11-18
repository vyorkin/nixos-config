{ ... }:

let basePath = ../dotfiles/ocaml;
in {
  home-manager.users.vyorkin = {
    home.file = {
      ".utoprc" = { source = basePath + "/utoprc"; };
      ".ocamlinit" = { source = basePath + "/ocamlinit"; };
    };
  };
}
