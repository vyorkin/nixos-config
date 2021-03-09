{
  home-manager.users.vyorkin = {
    home.file = {
      ".utoprc" = { source = ./utoprc; };
      ".ocamlinit" = { source = ./ocamlinit; };
    };
  };
}
