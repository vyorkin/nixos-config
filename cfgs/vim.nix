{ pkgs, ... }:

let
  neovimGtk = pkgs.callPackage ../pkgs/custom/neovim-gtk { };
in
  {
    environment.systemPackages = with pkgs; [
      (vim_configurable.override { python = python3; })
      neovim
      neovimGtk
    ];
  }
