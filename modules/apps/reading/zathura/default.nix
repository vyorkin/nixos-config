{
  home-manager.users.vyorkin = {
    programs.zathura.enable = true;

    home.file = {
      "zathura" = {
        source = ./zathurarc;
        target = ".config/zathura/zathurarc";
      };
    };
  };
}
