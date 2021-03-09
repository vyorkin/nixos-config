{
  home-manager.users.vyorkin = {
    home.file = {
      "zathura" = {
        source = ./zathurarc;
        target = ".config/zathura/zathurarc";
      };
    };
  };
}
