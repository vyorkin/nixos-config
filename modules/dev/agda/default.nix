{
  home-manager.users.vyorkin = {
    home.file = {
      ".agda" = {
        source = ./defaults;
        target = "./agda/defaults";
      };
    };
  };
}
