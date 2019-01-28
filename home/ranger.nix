{ ... }:

{
  home.file = {
    "ranger" = {
      source = ./dotfiles/ranger;
      target = ".config/ranger";
      recursive = true;
    };
  };
}

