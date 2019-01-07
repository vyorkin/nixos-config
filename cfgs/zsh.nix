{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    zplug = {
       enable = true;
    };
  };
}
