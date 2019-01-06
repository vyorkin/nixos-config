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
      source = ./zsh/zshrc;
    };

    ".zsh" = {
      source = ./zsh/zsh;
    };
  };
}
