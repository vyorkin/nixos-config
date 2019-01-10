{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    history.expireDuplicatesFirst = true;
  };

  home.file = {
    ".zshrc" = { source = ./dotfiles/zsh/zshrc; };
    ".zshenv" = { source = ./dotfiles/zsh/zshenv; };
    ".zprofile" = { source = ./dotfiles/zsh/zprofile; };
    ".zlogin" = { source = ./dotfiles/zsh/zlogin; };
    ".zlogout" = { source = ./dotfiles/zsh/zlogout; };
    ".zsh" = { source = ./dotfiles/zsh/zsh; };
 };
}
