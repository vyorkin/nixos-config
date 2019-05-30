{ ... }:

{
  home-manager.users.vyorkin = {
    home.file = {
      "dunst" = {
        source = ./dotfiles/dunst;
        target = ".config/dunst";
      };
    };
  };
}
