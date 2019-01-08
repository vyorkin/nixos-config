{ pkgs, ... }:

{
  home.file = {
    ".tmux.conf" = {
      source = ./dotfiles/tmux/tmux.conf;
    };

    ".tmux" = {
      source = ./dotfiles/tmux/tmux;
    };
  };
}
