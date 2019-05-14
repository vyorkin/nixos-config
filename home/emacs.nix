{ pkgs, ... }:

{
  home.file = {
    "emacs.d" = { source = ./emacs.d; };
  };
}
