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
}
