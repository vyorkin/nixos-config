{ pkgs, ... }:

let
  neovimGtk = pkgs.callPackage ../pkgs/custom/neovim-gtk { };
in
  {
    environment.systemPackages = with pkgs; [
      (pkgs.vim_configurable.override { python3 = true; })
      neovim
      neovimGtk
    ];
  }
