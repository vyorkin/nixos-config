{ ... }:

{
  home.file = {
    "alacritty" = {
      source = ./dotfiles/alacritty;
      target = ".config/alacritty";
    };

    "kitty" = {
      source = ./dotfiles/kitty;
      target = ".config/kitty";
    };
  };
}
