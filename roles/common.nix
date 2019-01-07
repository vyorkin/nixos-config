{ config, pkgs, ... }:

{
  imports = [
    ../options/default.nix
    ../cfgs/users.nix
    ../cfgs/base.nix
    ../cfgs/networkmanager.nix
    ../cfgs/scm.nix
    ../cfgs/compression.nix
    ../cfgs/encryption.nix
    ../cfgs/grep.nix
    ../cfgs/zsh.nix
    ../cfgs/vim.nix
    ../cfgs/emacs.nix
    ../cfgs/http-clients.nix
    ../cfgs/ssh.nix
  ];
}
