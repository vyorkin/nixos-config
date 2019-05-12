{ config, pkgs, ... }:

{
  imports = [
    ../options/default.nix
    ../cfgs/users.nix
    ../cfgs/base.nix
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

  nixpkgs.config.allowUnfree = true;
  nix.trustedUsers = [ "root" ];
}
