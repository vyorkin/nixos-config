{ pkgs, ... }:

{
  imports = [
    ./base.nix
    ./ssh.nix
    ./zsh.nix
    ./git.nix
  ];

  programs = {
    home-manager = {
      enable = true;
      path = https://github.com/rycee/home-manager/archive/master.tar.gz;
    };
  };
}
