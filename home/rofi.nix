{ ... }:

{
  home-manager.users.vyorkin = {
    home.file = {
      "rofi" = {
        source = ./dotfiles/rofi;
        target = ".config/rofi";
      };
    };
  };
}
