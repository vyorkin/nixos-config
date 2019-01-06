{ config, pkgs, ... }:

{
  imports = [
    ../options/default.nix
    ../cfgs/base.nix
    ../cfgs/scm.nix
    ../cfgs/git.nix
    ../cfgs/compression.nix
    ../cfgs/grep.nix
    ../cfgs/zsh.nix
    ../cfgs/vim.nix
    ../cfgs/emacs.nix
    ../cfgs/http-clients.nix
    ../cfgs/ssh.nix
  ];
}
