{ pkgs, ... }:

let
  neovimGtk = pkgs.callPackage ../pkgs/custom/neovim-gtk { };
in
  {
    environment.systemPackages = with pkgs; [
      vim
      neovim
      # neovimGtk
    ];
  }
