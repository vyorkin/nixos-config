{
  home-manager.users.vyorkin = {
    home.file = {
      ".lein" = {
        source = ./lein;
        recursive = true;
      };
    };
  };
}
