{ ... }:

{
  home-manager.users.vyorkin = {
    home.file = {
      "zathura" = {
        source = ./dotfiles/zathura;
        target = ".config/zathura";
        recursive = true;
      };
    };
  };
}
