{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    history.expireDuplicatesFirst = true;
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
