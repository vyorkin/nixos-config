{
  home-manager.users.vyorkin = {
    home.file = {
      ".npmrc" = { source = ./npmrc; };
    };
  };
}
