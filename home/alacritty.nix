{ ... }:

{
  home.file = {
    "alacritty" = {
      source = ./dotfiles/alacritty;
      target = ".config/alacritty";
    };
  };
}
