{ ... }:

{
  home-manager.users.vyorkin = {
    home.file = {
      "autorandr" = {
        source = ./dotfiles/autorandr;
        target = ".config/autorandr";
      };
    };
  };
}
