{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    history.expireDuplicatesFirst = true;

    zplug = {
      enable = true;
      plugins = [
      ];
    };
  };


  home.file = {
    ".zshrc" = {
      source = ./dotfiles/zsh/zshrc;
    };

    ".zsh" = {
      source = ./dotfiles/zsh/zsh;
    };
  };
}
