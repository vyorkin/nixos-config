{ config, pkgs, ... }:

{
  imports = [
    ../cfgs/users
    ../cfgs/base
    ../cfgs/network.nix
    ../cfgs/scm.nix
    ../cfgs/compression.nix
    ../cfgs/encryption.nix
    ../cfgs/tools.nix
    ../cfgs/keyboard.nix
    ../cfgs/search-tools.nix
    ../cfgs/libs.nix
  # ../cfgs/zsh.nix
    ../cfgs/tmux.nix
    ../cfgs/vim.nix
    ../cfgs/emacs.nix
    ../cfgs/http-clients.nix
    ../cfgs/ssh.nix
  ];
}
